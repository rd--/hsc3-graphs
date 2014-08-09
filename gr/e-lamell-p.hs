-- e-lamell-p (rd)

import Sound.SC3 {- hsc3 -}
import qualified Sound.SC3.Lang.Pattern.Plain as P {- hsc3-lang -}

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

patterns :: [(Synthdef,P.Param)]
patterns =
    let sy = synthdef "e-lamell" (out 0 e_lamell)
        to_cps = P.degree_to_cps' [0,2,4,5,7,9,11] 12
    in [(sy,[("freq",to_cps (P.rand 'β' [0,2,5,7]) (P.wrand 'γ' [2,3,4,5] [0.2,0.35,0.35,0.1]))
            ,("dur",repeat 0.1)
            ,("d",P.white 'δ' 0.01 0.8)
            ,("amp",P.white 'ε' 0 0.75)
            ,("n",P.white 'ζ' 2 36)
            ,("l",P.white 'η' (-1) 1)])
       ,(sy,[("freq",to_cps (P.rand 'θ' [0]) (P.rand 'ι' [1,2,3]))
            ,("dur",repeat 0.1)
            ,("d",P.white 'κ' 0.01 1.2)
            ,("amp",P.rand 'λ' [0,0.25,0.5,1])
            ,("n",P.white 'μ' 2 36)
            ,("l",P.white 'ν' (-1) 1)])]

main :: IO ()
main = audition (P.sbind patterns)
