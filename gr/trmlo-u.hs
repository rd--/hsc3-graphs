-- trmlo-u (rd)

import Sound.SC3 {- hsc3 -}
import Sound.SC3.UGen.Unsafe {- hsc3-unsafe -}
import Sound.SC3.Lang.Pattern.ID {- hsc3-lang -}

-- > audition (out 0 trmlo)
trmlo :: UGen
trmlo =
    let mWrp i l r = linLin i (-1) 1 (midiCPS l) (midiCPS r)
        mWrp1 i m = mWrp i m (m + 1)
        mWrpN i m n = mWrp i m (m + n)
        o1 = let f = 5
                 d = 3
                 s = envSine d 0.1
                 e = envGen KR 1 1 0 1 DoNothing s
                 n = 65
                 m = sinOsc KR f 0
             in pan2 (sinOsc AR (mWrp1 m n) 0) m e
        o2 = let f = iRand 5 9
                 d = iRand 5 9
                 s = envSine d (rand 0.1 0.2)
                 e = envGen KR 1 1 0 1 DoNothing s
                 n = iRand 69 72
                 m = sinOsc KR f 0
             in pan2 (sinOsc AR (mWrp1 m n) 0) m e
        o3 = let f = iRand 5 9
                 d = iRand 9 12
                 s = envSine d (rand 0.1 0.2)
                 e = envGen KR 1 1 0 1 DoNothing s
                 n = iRand 69 72
                 m = sinOsc KR f 0
                 l = line KR 0 (iRand 1 5) d DoNothing
             in pan2 (blip AR (mWrp1 m (n + l)) (linLin m (-1) 1 1 2)) m e
        o4 = let f = iRand 5 18
                 d = iRand 12 15
                 s = envSine d (rand 0.1 0.2)
                 e = envGen KR 1 5e-2 0 1 DoNothing s
                 n = iRand 69 72
                 m = sinOsc KR f 0
                 l = line KR 0 (iRand 1 5) d RemoveSynth
                 fr = mWrpN m (n + l) (iRand 1 5)
             in pan2 (blip AR fr (linLin m (-1) 1 1 (iRand 2 24))) m e
    in o1 + o2 + o3 + o4

main :: IO ()
main = do
  let s = synthdef "trmlo" (out 0 trmlo)
      p = pbind [("instr",psynth s)
                ,("dur",pxrand 'α' [0.25,0.5,1,2,4] inf)
                ,("legato",1.25)]
  audition p