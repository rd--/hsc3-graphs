-- aleatoric quartet (jmcc) #7
let basemn = 66
    amp = 0.07
    density = MouseX 0.01 1 linear 0.1
    dMul = Recip density * 0.5 * amp
    dAdd = amp - dMul
    rapf i = AllpassN i 0.05 [Rand 0 0.05, Rand 0 0.5] 1
    mkf () = let m = LfNoise0 (choose [1,  0.5,  0.25]) * 7 + basemn + Rand2 30
             in Recip (MidiCps (Lag (RoundTo m 1) 0.2))
    mks () = let x = PinkNoise () * Max 0 (LfNoise1 8 * dMul + dAdd)
             in Pan2 (CombL x 0.02 (mkf ()) 3) (Rand2 1) 1
    g = iter 5 rapf (mks !+ 5)
in LeakDc g 0.995
