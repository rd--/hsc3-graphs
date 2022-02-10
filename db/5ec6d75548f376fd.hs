-- why supercollider (jmcc) #0
let s = mixFill 10 (\_ -> resonz (dust ar 0.2 * 50) (rand 200 3200) 0.003)
    y = mixFill 7 (\_ -> combL (delayN s 0.048 0.048) 0.1 (lfNoise1 kr (rand 0 0.1) * 0.04 + 0.05) 15)
    f i = allpassN i 0.05 (X.randN 2 0 0.05) 1
in s + 0.2 * iter 4 f y
