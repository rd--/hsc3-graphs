-- why supercollider (jmcc) #0
let s = DelayN (mixFill 10 (\_ -> Resonz (Dust 0.2 * 50) (Rand 200 3200) 0.003)) 0.048 0.048
    y = mixFill 7 (\_ -> CombL s 0.1 (LFNoise1 (Rand 0 0.1) * 0.04 + 0.05) 15)
    f i = AllpassN i 0.05 [Rand 0 0.05,  Rand 0 0.05] 1
in s + 0.2 * iter 4 f y
