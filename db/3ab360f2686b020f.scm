; why supercollider (jmcc) #0
(let* ((s (mixFill 10 (lambda (_) (Resonz (Mul (Dust ar 0.2) 50) (Rand 200 3200) 0.003))))
       (z (DelayN s 0.048 0.048))
       (y (mixFill 7 (lambda (_) (CombL z 0.1 (MulAdd (LFNoise1 kr (Rand 0 0.1)) 0.04 0.05) 15))))
       (x (iter 4 (lambda (i) (AllpassN i 0.05 (RandN 2 0 0.05) 1)) y)))
  (Add s (Mul x 0.2)))
