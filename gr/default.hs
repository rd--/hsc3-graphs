-- default (jmcc)

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.Lang.Pattern {- hsc3-lang -}

defaultInstrument :: Synthdef
defaultInstrument =
    let f = control KR "freq" 440
        a = control KR "amp" 0.1
        p = control KR "pan" 0
        g = control KR "gate" 1
        e = linen g 0.01 0.7 0.3 RemoveSynth
        f3 = mce [f,f + rand 'α' (-0.4) 0,f + rand 'β' 0 0.4]
        l = xLine KR (rand 'γ' 4000 5000) (rand 'δ' 2500 3200) 1 DoNothing
        z = lpf (mix (varSaw AR f3 0 0.3 * 0.3)) l * e
    in synthdef "default" (out 0 (pan2 z p a))

pattern :: P_Bind
pattern =
    [(K_instr,psynth defaultInstrument)
    ,(K_note,pxrand 'ε' [0,1,5,7,9] inf)
    ,(K_octave,prand 'ζ' [3,4,5,6] inf)
    ,(K_dur,pwrand 'η' [0.1,0.2,0.4] [0.5,0.4,0.1] inf)
    ,(K_amp,pbrown 'θ' 0.01 0.2 0.01 inf)
    ,(K_param "pan",pbrown 'ι' (-1) 1 0.25 inf)]

main :: IO ()
main = audition (pbind pattern)
