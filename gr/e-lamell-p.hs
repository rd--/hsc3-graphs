-- e-lamell-p (rd)

import Sound.SC3.ID {- hsc3 -}
import Sound.SC3.Lang.Pattern.ID {- hsc3-lang -}

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

patterns :: [P_Bind Double]
patterns =
    [[("note",prand 'β' [0,2,5,7] inf)
     ,("octave",pwrand 'γ' [2,3,4,5] [0.2,0.35,0.35,0.1] inf)
     ,("dur",0.1)
     ,("d",pwhite 'δ' 0.01 0.8 inf)
     ,("amp",pwhite 'ε' 0 0.75 inf)
     ,("n",pwhite 'ζ' 2 36 inf)
     ,("l",pwhite 'η' (-1) 1 inf)]
    ,[("note",prand 'θ' [0] inf)
     ,("octave",prand 'ι' [2,3] inf)
     ,("dur",0.1)
     ,("d",pwhite 'κ' 0.01 1.2 inf)
     ,("amp",prand 'λ' [0,0.25,0.5,1] inf)
     ,("n",pwhite 'μ' 2 36 inf)
     ,("l",pwhite 'ν' (-1) 1 inf)]]

main :: IO ()
main =
    let s = synthdef "e-lamell" (out 0 e_lamell)
    in audition (s,ppar (map pbind patterns))
