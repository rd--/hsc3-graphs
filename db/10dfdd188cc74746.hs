-- wial (rd, 2006-09-21)
let pls c d f = let t = pulseDivider c d 0
                    e = decay2 t 0.05 0.75
                    o = sinOsc ar (toggleFF t * f + f * 2) 0
                in o * e * tiRand 0 1 t * 0.5
    smpl f = [(4,6,f,0.0075)
             ,(2,6,f * 2,0.0175)
             ,(1,2,f * 16,0.025)
             ,(1,5,f * 64,0.005)
             ,(1,4,f * 128,0.035)
             ,(1,3,f * 256,0.15)
             ,(2,3,f * 512,0.35)]
    plss c (d0,d1,f,a) = pls c (mce2 d0 d1) f * a
    clk = impulse ar 16 0
    f = tWChoose (dust kr 2) (mce2 (20 * 0.66) 20) (mce2 0.25 0.75) 0
in sum (map (plss clk) (smpl f))
