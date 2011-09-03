-- e-lamell-p (rd)

import Sound.SC3.ID
import Sound.SC3.Lang.Control.Event
import Sound.SC3.Lang.Pattern.ID

e_lamell :: UGen
e_lamell =
    let ctl nm v = control KR nm v
        f = ctl "freq" 440
        a = ctl "amp" 1
        d = ctl "d" 0.1
        n = ctl "n" 12
        l = ctl "l" 0
        t = iChoose 'a' (mce2 1 32)
        h = line AR n t d DoNothing
        s = blip AR f h
        e_d = envPerc 0.005 d
        e = envGen AR 1 a 0 1 RemoveSynth e_d
    in pan2 s l e

pattern :: P Event
pattern =
  let p = pbind [("note",prand 'a' [0,2,5,7] inf)
                ,("octave",pwrand 'b' [2,3,4,5] [0.2,0.35,0.35,0.1] inf)
                ,("dur",0.1)
                ,("d",pwhite 'c' 0.01 0.8 inf)
                ,("amp",pwhite 'd' 0 0.75 inf)
                ,("n",pwhite 'e' 2 36 inf)
                ,("l",pwhite 'f' (-1) 1 inf)]
      q = pbind [("note",prand 'g' [0] inf)
                ,("octave",prand 'h' [2,3] inf)
                ,("dur",0.1)
                ,("d",pwhite 'i' 0.01 1.2 inf)
                ,("amp",prand 'j' [0,0.25,0.5,1] inf)
                ,("n",pwhite 'k' 2 36 inf)
                ,("l",pwhite 'l' (-1) 1 inf)]
  in ppar [p,q]

main :: IO ()
main =
    let s = synthdef "e-lamell" (out 0 e_lamell)
    in audition (s,pattern)
