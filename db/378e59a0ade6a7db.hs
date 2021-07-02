-- why supercollider (jmcc) #0 ; id
let s = mixFillId 'α' 10 (\z _ -> resonz (dustId z ar 0.2 * 50) (randId z 200 3200) 0.003)
    y = mixFillId 'β' 7 (\z _ -> combL (delayN s 0.048 0.048) 0.1 (lfNoise1Id z kr (randId z 0 0.1) * 0.04 + 0.05) 15)
    f z i = allpassN i 0.05 (mce2 (randId (z,'γ') 0 0.05) (randId (z,'δ') 0 0.05)) 1
    x = foldl (&) y (map f (id_seq 4 'ε'))
in s + 0.2 * x
