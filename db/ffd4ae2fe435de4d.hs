-- reverberated sine percussion (jmcc) #3
let s = mixFill 6 (\_ -> resonz (dust ar (2 / 6) * 50) (200 + rand 0 3000) 0.003)
    y = mix (combL (delayN s 0.048 0.48) 0.1 (lfNoise1 kr (X.rRandN 5 0 0.1) * 0.04 + 0.05) 15)
    x = iter 4 (\i -> allpassN i 0.05 (X.rRandN 2 0 0.05) 1) y
in s + x * 0.2
