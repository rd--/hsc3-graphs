-- why supercollider (jmcc) #0
let r () = Resonz (Dust 0.2 * 50) (Rand 200 3200) 0.003
    s = DelayN (r !+ 10) 0.048 0.048
    y () = CombL s 0.1 (LfNoise1 (Rand 0 0.1) * 0.04 + 0.05) 15
    f i = AllpassN i 0.05 [Rand 0 0.05, Rand 0 0.05] 1
in iter 4 f (y !+ 7) * 0.2 + s
