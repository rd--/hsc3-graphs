; why supercollider (jmcc) #0
(let* ((s (mix-fill 10 (lambda (_) (Resonz (Mul (Dust ar 0.2) 50) (Rand 200 3200) 0.003))))
       (z (DelayN s 0.048 0.048))
       (y (mix-fill 7 (lambda (_) (CombL z 0.1 (MulAdd (LFNoise1 kr (Rand 0 0.1)) 0.04 0.05) 15))))
       (f (lambda (i) (AllpassN i 0.05 (RRandN 2 0 0.05) 1)))
       (x ((foldl1 compose (replicate 4 f)) y)))
  (Add s (Mul x 0.2)))