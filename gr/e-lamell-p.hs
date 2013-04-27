-- e-lamell-p (rd)

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.Lang.Pattern {- hsc3-lang -}

e_lamell :: UGen
e_lamell =
    let ctl = control KR
        f = ctl "freq" 440
        a = ctl "amp" 1
        d = ctl "d" 0.1
        n = ctl "n" 12
        l = ctl "l" 0
        t = lchoose 'α' [1,32]
        h = line AR n t d DoNothing
        s = blip AR f h
        e_d = envPerc 0.005 d
        e = envGen AR 1 a 0 1 RemoveSynth e_d
    in pan2 s l e

patterns :: [[P_Bind]]
patterns =
    let i = psynth (synthdef "e-lamell" (out 0 e_lamell))
    in [[(K_instr,i)
        ,(K_note,prand 'β' [0,2,5,7] inf)
        ,(K_octave,pwrand 'γ' [2,3,4,5] [0.2,0.35,0.35,0.1] inf)
        ,(K_dur,0.1)
        ,(K_param "d",pwhite 'δ' 0.01 0.8 inf)
        ,(K_amp,pwhite 'ε' 0 0.75 inf)
        ,(K_param "n",pwhite 'ζ' 2 36 inf)
        ,(K_param "l",pwhite 'η' (-1) 1 inf)]
       ,[(K_instr,i)
        ,(K_note,prand 'θ' [0] inf)
        ,(K_octave,prand 'ι' [2,3] inf)
        ,(K_dur,0.1)
        ,(K_param "d",pwhite 'κ' 0.01 1.2 inf)
        ,(K_amp,prand 'λ' [0,0.25,0.5,1] inf)
        ,(K_param "n",pwhite 'μ' 2 36 inf)
        ,(K_param "l",pwhite 'ν' (-1) 1 inf)]]

main :: IO ()
main = audition (ppar (map pbind patterns))
