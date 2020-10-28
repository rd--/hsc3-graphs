-- http://sccode.org/1-1Kl (jar)
-- partial...

import Sound.OSC {- hosc -}
import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Collection.Numerical.Truncating () {- hsc3-lang -}
import qualified Sound.SC3.Lang.Pattern.Plain as P {- hsc3-lang -}

chain :: a -> [a -> a] -> a
chain n c =
    case c of
      [] -> n
      f:c' -> chain (f n) c'

-- > audition ping
ping :: UGen
ping =
    let k = control KR
        f = control KR "freq" 440
        a = control KR "amp" 0.1
        es = control KR "sustain" 0.1
        tr = impulse AR 0 0
        dy = decay2 tr (k "attack" 0.0001) (k "impdecay" 0.01)
        i = mix (ringz dy (f * mce2 1 2) es)
        r = chain i [\s -> let e = decay2 tr 0.01 (k "hdur" 0.1)
                               fr = mce [rand 'α' 1 1.1
                                        ,rand 'β' 1.4 1.6
                                        ,rand 'γ' 1.9 2.1
                                        ,rand 'δ' 3.9 4.1]
                           in s + mix (sinOsc AR (f * fr) 0 * e)
                    ,\s -> bLowPass s (k "ffreq" 1000 * linExp dy 0 1 1 (k "famt" 3)) 0.1
                    ,\s -> let e = envLinen 0 (es / rand 'ε' 1 4) 0.1 1
                           in s * envGen AR 1 1 0 1 RemoveSynth e]
    in out (k "out" 0) (r * mce2 a a)

pattern :: P.Param_MCE
pattern =
    let octave = P.rand 'ζ' [6,7]
        degree = P.lace [[0,1,2,3,4]
                        ,[2,3,4,5,6]
                        ,[4,3,4,3,6,7]
                        ,[0,2,1,2,1,4,3,3,5]]
        detune = P.white 'η' (-2) 2
        to_cps = P.degree_to_cps [0,2,4,5,7,9,11] 12
        freq = zipWith to_cps degree octave + detune
    in [("freq",freq)
       ,("attack",P.white 'λ' 0.0005 0.001)
       ,("sustain",(octave / 4) + P.white 'μ' 0.01 0.5)
       ,("ffreq",P.white 'ν' 200 2000)
       ,("famt",P.white 'ξ' 3 6)
       ,("hdur",P.white 'ο' 0.05 0.3)
       ,("impdecay",P.white 'π' 0.001 0.01)
       ,("amp",P.white 'κ' 0.01 0.1 * 0.3)
       ,("dur",P.rand 'θ' [0.5,1,2] + P.white 'ι' (-0.1) 0.1)]

amplitude_mod :: (ID a, Enum a) => a -> UGen -> UGen
amplitude_mod z i =
    let a = range 0.001 0.1 (lfNoise2 z KR 0.1)
        f = range (midiCPS 60) (midiCPS 61) (lfNoise2 (succ z) KR 0.1)
    in i * (sinOsc AR (f/4) 0 * a + (1 - a))

limiting :: UGen -> UGen
limiting i = compander i i 0.1 1 0.3 1e-2 0.1

post :: Transport m => String -> Int -> UGen -> (UGen -> UGen) -> m ()
post nm nc b f = do
  let i = in' nc AR b
      s = synthdef nm (replaceOut b (f i))
  _ <- async (d_recv s)
  sendMessage (s_new nm (-1) AddToTail 2 [])

main :: IO ()
main = do
  let sy = synthdef "ping" ping
  withSC3 (do post "amplitude_mod" 2 0 (amplitude_mod 'ρ')
              post "limiting" 2 0 limiting
              nrt_play (P.sbind1 (sy,pattern)))
