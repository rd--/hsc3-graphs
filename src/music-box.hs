-- http://sccode.org/1-1Kl
-- partial...

import Sound.OpenSoundControl {- hosc -}
import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.Lang.Control.Event {- hsc3-lang -}
import Sound.SC3.Lang.Pattern.ID

chain :: a -> [a -> a] -> a
chain n c =
    case c of
      [] -> n
      f:c' -> chain (f n) c'

ping :: UGen
ping =
    let o = control KR "out" 0
        f = control KR "freq" 440
        a = control KR "amp" 0.1
        ed = control KR "impdecay" 0.01
        ea = control KR "attack" 0.0001
        es = control KR "sustain" 0.1
        fa = control KR "famt" 3
        ff = control KR "ffreq" 1000
        hd = control KR "hdur" 0.1
        tr = impulse AR 0 0
        dy = decay2 tr ea ed * 1
	i = mix (ringz dy (f * mce2 1 2) es)
	r = chain i [\s -> let e = decay2 tr 0.01 hd
                               fr = mce [rand 'a' 1 1.1
                                        ,rand 'a' 1.4 1.6
                                        ,rand 'a' 1.9 2.1
                                        ,rand 'a' 3.9 4.1]
                           in s + mix (sinOsc AR (f * fr) 0 * e)
   	            ,\s -> bLowPass s (ff * linExp dy 0 1 1 fa) 0.1
   	            ,\s -> let e = envLinen 0 (es / rand 'a' 1 4) 0.1 1
                           in s * envGen AR 1 1 0 1 RemoveSynth e]
    in offsetOut o (r * mce2 a a)

pattern :: P Event
pattern =
    let o = prand 'a' [6,7] inf
    in pbind [("degree",place [[0,1,2,3,4]
                              ,[2,3,4,5,6]
                              ,[4,3,4,3,6,7]
                              ,[0,2,1,2,1,4,3,3,5]] inf)
	     ,("detune",pwhite 'b' (-2) 2 inf)
             ,("octave",o)
             ,("dur",prand 'c' [0.5,1,2] inf + pwhite 'd' (-0.1) 0.1 inf)
             ,("amp",pwhite 'e' 0.01 0.1 inf)
	     ,("attack",pwhite 'f' 0.0005 0.001 inf)
	     ,("sustain",(o / 4) + pwhite 'g' 0.01 0.5 inf)
	     ,("ffreq",pwhite 'h' 200 2000 inf)
	     ,("famt",pwhite 'i' 3 6 inf)
	     ,("hdur",pwhite 'j' 0.05 0.3 inf)
	     ,("impdecay",pwhite 'k' 0.001 0.01 inf)]

amplitude_mod :: (ID a, Enum a) => a -> UGen -> UGen
amplitude_mod z i =
    let a = range 0.001 0.1 (lfNoise2 z KR 0.1)
        f = range (midiCPS 60) (midiCPS 61) (lfNoise2 (succ z) KR 0.1)
    in i * (sinOsc AR (f/4) 0 * a + (1 - a))

limiting :: UGen -> UGen
limiting i = compander i i 0.1 1 0.3 1e-2 0.1

post :: Transport t => String -> Int -> UGen -> (UGen -> UGen) -> t -> IO ()
post nm nc b f fd = do
  let i = in' nc AR b
      s = synthdef nm (replaceOut b (f i))
  _ <- async fd (d_recv s)
  send fd (s_new nm (-1) AddToTail 2 [])

main :: IO ()
main = do
  let s = synthdef "ping" ping
  withSC3 (\fd -> post "amplitude_mod" 2 0 (amplitude_mod 'a') fd >>
                  post "limiting" 2 0 limiting fd)
  audition (s,pattern)