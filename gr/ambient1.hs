-- http://sccode.org/1-1y
-- some edits......

import Control.Applicative
import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Control.Instrument {- hsc3-lang -}
import Sound.SC3.Lang.Pattern.ID

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

{-
audition pulse_u
audition drone_u
audition bass_u
-}

pulse_i :: Instrument
pulse_i = InstrumentDef (synthdef "pulse" pulse_u) False

drone_i :: Instrument
drone_i = InstrumentDef (synthdef "drone" drone_u) False

bass_i :: Instrument
bass_i = InstrumentDef (synthdef "bass" bass_u) False

dur_p :: Fractional a => P a
dur_p = prand 'β' [3,0.7,1,0.5] inf

pulse_p :: P_Bind Double
pulse_p =
    [("dur",dur_p * 10)
    ,("midinote",prand 'α' [59,72,76,79,81,88,90] inf)
    ,("amp",pwhite 'β' 0.2 0.27 inf)
    ,("attackTime",pwhite 'γ' 0 7 inf)
    ,("delayTime",0.02)]

drone_p :: P_Bind Double
drone_p =
    [("dur",dur_p)
    ,("midinote",prand 'α' [31,40,45,64,68,69] inf)
    ,("amp",pwhite 'β' 0.03 0.08 inf * 0.7)
    ,("phase",pwrand 'γ' [0,4.7123] [0.5,0.5] inf)]

bass_p :: P_Bind Double
bass_p =
    [("dur",dur_p)
    ,("midinote",31)
    ,("amp",0.3)]

main :: IO ()
main = do
  let p = ppar [pinstr (pure pulse_i) (pbind pulse_p)
               ,pinstr (pure drone_i) (pbind drone_p)
               ,pinstr (pure bass_i) (pbind bass_p)]
  audition p
