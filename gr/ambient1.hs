-- http://sccode.org/1-1y
-- some edits......

import Sound.SC3 {- hsc3 -}
import qualified Sound.SC3.Lang.Pattern.Plain as P {- hsc3-lang -}

chain :: a -> [a -> a] -> a
chain n ff =
    case ff of
      [] -> n
      f:ff' -> chain (f n) ff'

chain0 :: Num a => [a -> a] -> a
chain0 = chain 0

pulse_u :: UGen
pulse_u =
    let k = control KR
        f = k "freq" 440
        a = k "amp" 0.1
        aT = k "attackTime" 0.01
        dT = k "delayTime" 10
        e = envGen KR 1 1 0 1 RemoveSynth (envPerc aT 10)
        z = sinOsc AR f 0 * 0.7
        o = let l = sinOsc KR 3 0
            in pan2 (toggleFF (tDelay z dT) * sinOsc AR f 0) l 0.6
        s = clip2 ((pan2 z (sinOsc KR 5 pi) 0.7 + o) * e) 1
    in out 0 (freeVerb s 0.7 1.0 0.4 * a)

drone_u :: UGen
drone_u =
    let k = control KR
        f = k "freq" 440
        a = k "amp" 0.1
        ph = k "phase" 0
        e = envGen KR 1 1 0 1 RemoveSynth (envSine 10 1)
        s = chain0 [\_ -> lfPulse AR f 0 0.15
                   ,\o -> rlpf o (sinOsc KR 0.3 0 * 200 + 1500) 0.1
                   ,\o -> freeVerb o 0.5 0.5 0.5 * e
                   ,\o -> pan2 o (sinOsc KR (1/10) ph) a]
    in out 0 s

bass_u :: UGen
bass_u =
    let k = control KR
        f = k "freq" 96
        a = k "amp" 0.1
        e = envGen KR 1 1 0 1 RemoveSynth (envPerc' 0.5 1 1 (EnvLin,EnvLin))
        s = sinOsc AR f 0 * a * e
    in out 0 (pan2 s 0 1)

pulse_s :: Synthdef
pulse_s = synthdef "pulse" pulse_u

drone_s :: Synthdef
drone_s = synthdef "drone" drone_u

bass_s :: Synthdef
bass_s = synthdef "bass" bass_u

dur_p :: Fractional a => [a]
dur_p = P.rand 'β' [3,0.7,1,0.5]

pulse_p :: P.Param
pulse_p =
    [("dur",map (* 10) dur_p)
    ,("freq",fmap midiCPS (P.rand 'α' [59,72,76,79,81,88,90]))
    ,("amp",P.white 'β' 0.2 0.27)
    ,("attackTime",P.white 'γ' 0 7)
    ,("delayTime",repeat 0.02)]

drone_p :: P.Param
drone_p =
    [("dur",dur_p)
    ,("freq",fmap midiCPS (P.rand 'α' [31,40,45,64,68,69]))
    ,("amp",P.white 'β' 0.02 0.06)
    ,("phase",P.rand 'γ' [0,4.7123])]

bass_p :: P.Param
bass_p =
    [("dur",dur_p)
    ,("freq",repeat (midiCPS 31))
    ,("amp",repeat 0.3)]

main :: IO ()
main = do
  let sc = P.sbind [(pulse_s,pulse_p)
                   ,(drone_s,drone_p)
                   ,(bass_s,bass_p)]
  nrt_audition sc

{-
nrt_audition (P.sbind1 (pulse_s,pulse_p))
nrt_audition (P.sbind1 (bass_s,bass_p))
-}
