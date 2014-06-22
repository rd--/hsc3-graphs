-- adc-16-6-2 (adc) #p.489

import Sound.SC3 {- hsc3 -}
import qualified Sound.SC3.Lang.Pattern.List as L {- hsc3-lang -}
import qualified Sound.SC3.Lang.Pattern.Plain as P {- hsc3-lang -}

constQ :: UGen
constQ =
    let k = control IR
        bufnum = k "bufnum" 0
        sustain = k "sustain" 0.1
        rate = k "rate" 1
        freq = k "freq" 400
        rq = control KR "rq" 0.3
        ringtime = min ((2.4 / (freq * rq)) * 0.66) 0.5 -- estimated
        ampcomp = (rq ** (-1)) * ((400 / freq) ** 0.5)
        envSig = let env = envelope [0,k "amp" 0.1,0] (map (* sustain) [0.5,0.5]) [EnvWelch]
                 in envGen AR 1 1 0 1 DoNothing env
        cutoffEnv = let env = envelope [1,1,0] [sustain + ringtime,0.01] [EnvLin]
                    in envGen KR 1 1 0 1 RemoveSynth env
        startPos = (k "centerPos" 0.5 - (sustain * rate * 0.5)) * bufSampleRate IR bufnum
        grain = playBuf 1 AR bufnum rate 0 startPos Loop DoNothing * envSig
        filtered = bpf grain freq rq * ampcomp
    in offsetOut (k "out" 0) (pan2 filtered (k "pan" 0) cutoffEnv)

p :: Double -> P.Param
p b =
    [("bufnum",repeat b)
    ,("sustain",P.white 'α' 0.02 0.04)
    ,("amp",P.white 'β' 0.05 0.25)
    ,("centerPos",cycle [0,0.01 .. 2])
    ,("dur",L.brown 'γ' 0.01 0.09 5)
    ,("rate",P.white 'δ' 0.95 1.05)
    ,("freq",map midiCPS (L.brown 'ε' 64 120 8))
    ,("pan",P.white 'ζ' (-1) 1)
    ,("rq",P.white 'η' 0.03 0.15)]

p' :: Double -> P.Param
p' b =
    [("bufnum",repeat b)
    ,("sustain",P.white 'θ' 0.02 0.04)
    ,("amp",repeat 0.3)
    ,("centerPos",cycle [0,0.01 .. 2])
    ,("dur",P.white 'ι' 0.01 0.03)
    ,("rate",P.white 'κ' 0.95 1.05)
    ,("freq",map midiCPS (L.brown 'λ' 80 82 8))
    ,("pan",P.white 'μ' (-1) 1)
    ,("rq",repeat 0.05)]

main :: IO ()
main = withSC3$do
  let fn = "/home/rohan/opt/share/SuperCollider/sounds/a11wlk01-44_1.aiff"
      sy = synthdef "constQ" constQ
  _ <- async (b_allocRead 0 fn 0 0)
  play (P.sbind [(sy,p 0),(sy,p' 0)])
