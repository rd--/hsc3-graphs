-- why supercollider (jmcc) #0
let s = delayn (mixfill 10 (\_ -> resonz (dust 0.2 * 50) (rand 200 3200) 0.003)) 0.048 0.048
    y = mixfill 7 (\_ -> combl s 0.1 (lfnoise1 (rand 0 0.1) * 0.04 + 0.05) 15)
    f i = allpassn i 0.05 [rand 0 0.05, rand 0 0.05] 1
in s + 0.2 * iter 4 f y
