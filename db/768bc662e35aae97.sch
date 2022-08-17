-- reverberated sine percussion (jmcc) #3
let d = 6
    rdst _ = Resonz (Dust (2 / d) * 50) (200 + Rand 0 3000) 0.003
    rapf i = AllpassN i 0.05 (RandN 2 0 0.05) 1
    z = DelayN (mixFill d rdst) 0.048 0.48
    y = Mix (CombL z 0.1 (LFNoise1 (RandN 5 0 0.1) * 0.04 + 0.05) 15)
    x = iter 4 rapf y
in z + x * 0.2
