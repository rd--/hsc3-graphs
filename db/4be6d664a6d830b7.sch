-- aleatoric quartet (jmcc) #7
let basemn = 66
    amp = 0.07
    density = MouseX 0.01 1 linear 0.1
    dMul = Recip density * 0.5 * amp
    dAdd = amp - dMul
    rapf i = AllpassN i 0.05 [Rand 0 0.05, Rand 0 0.5] 1
    mkf () = let m = LFNoise0 (listChoose [1,  0.5,  0.25]) * 7 + basemn + Rand2 30
             in Recip (MidiCps (Lag (Round m 1) 0.2))
    mks _ = let x = PinkNoise () * Max 0 (LFNoise1 8 * dMul + dAdd)
            in Pan2 (CombL x 0.02 (mkf ()) 3) (Rand2 1) 1
    g = iter 5 rapf (mixFill 5 mks)
in LeakDC g 0.995
