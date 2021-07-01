-- trmlo-u (rd)
let mWrp i l r = linLin_b i (midiCPS l) (midiCPS r)
    mWrp1 i m = mWrp i m (m + 1)
    mWrpN i m n = mWrp i m (m + n)
    o1 = let f = 5
             d = 3
             s = envSine d 0.1
             e = envGen kr 1 1 0 1 DoNothing s
             n = 65
             m = sinOsc kr f 0
         in pan2 (sinOsc ar (mWrp1 m n) 0) m e
    o2 = let f = iRand 5 9
             d = iRand 5 9
             s = envSine d (rand 0.1 0.2)
             e = envGen kr 1 1 0 1 DoNothing s
             n = iRand 69 72
             m = sinOsc kr f 0
         in pan2 (sinOsc ar (mWrp1 m n) 0) m e
    o3 = let f = iRand 5 9
             d = iRand 9 12
             s = envSine d (rand 0.1 0.2)
             e = envGen kr 1 1 0 1 DoNothing s
             n = iRand 69 72
             m = sinOsc kr f 0
             l = line kr 0 (iRand 1 5) d DoNothing
         in pan2 (blip ar (mWrp1 m (n + l)) (linLin_b m 1 2)) m e
    o4 = let f = iRand 5 18
             d = iRand 12 15
             s = envSine d (rand 0.1 0.2)
             e = envGen kr 1 5e-2 0 1 DoNothing s
             n = iRand 69 72
             m = sinOsc kr f 0
             l = line kr 0 (iRand 1 5) d RemoveSynth
             fr = mWrpN m (n + l) (iRand 1 5)
         in pan2 (blip ar fr (linLin_b m 1 (iRand 2 24))) m e
in o1 + o2 + o3 + o4
