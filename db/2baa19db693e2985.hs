-- resonators harmonic series (jmcc) #2 ; texture=xfade,1,7,inf
let nharm = 12
    spec _ = let rat = [1.0,1.125,1.25,1.333,1.5,1.667,1.875,2.0,2.25,2.5,2.667,3.0,3.333,3.75,4.0]
                 freq = lchoose rat * 120
                 series n i j = case n of {0 -> []; _ -> i : series (n - 1) (i + j) j}
             in klankSpec_mce
                (mce (series nharm freq freq) + X.randN nharm (-0.5) 0.5)
                (mceFill nharm (\i -> 1 / (i + 1)))
                (X.randN nharm 0.5 4.5)
    gen n = klank (brownNoise ar * 0.001) 1 0 1 (spec n)
in mceFill 2 gen
