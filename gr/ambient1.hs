-- http://sccode.org/1-1y
-- some edits......

import Sound.SC3 {- hsc3 -}
import Sound.SC3.Lang.Pattern {- hsc3-lang -}

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

pulse_i :: Instr
pulse_i = Instr_Def (synthdef "pulse" pulse_u) False

drone_i :: Instr
drone_i = Instr_Def (synthdef "drone" drone_u) False

bass_i :: Instr
bass_i = Instr_Def (synthdef "bass" bass_u) False

dur_p :: Fractional a => P a
dur_p = prand 'β' [3,0.7,1,0.5] inf

pulse_p :: P_Bind
pulse_p =
    [(K_instr,pinstr' pulse_i)
    ,(K_dur,dur_p * 10)
    ,(K_midinote,prand 'α' [59,72,76,79,81,88,90] inf)
    ,(K_amp,pwhite 'β' 0.2 0.27 inf)
    ,(K_param "attackTime",pwhite 'γ' 0 7 inf)
    ,(K_param "delayTime",0.02)]

drone_p :: P_Bind
drone_p =
    [(K_instr,pinstr' drone_i)
    ,(K_dur,dur_p)
    ,(K_midinote,prand 'α' [31,40,45,64,68,69] inf)
    ,(K_amp,pwhite 'β' 0.03 0.08 inf * 0.7)
    ,(K_param "phase",pwrand 'γ' [0,4.7123] [0.5,0.5] inf)]

bass_p :: P_Bind
bass_p =
    [(K_instr,pinstr' bass_i)
    ,(K_dur,dur_p)
    ,(K_midinote,31)
    ,(K_amp,0.3)]

main :: IO ()
main = do
  let p = ppar [pbind pulse_p
               ,pbind drone_p
               ,pbind bass_p]
  audition p
