; why supercollider (jmcc) #0
(let* ((s (Mix (Resonz (Mul (DustN 10 0.2) 50) (RandN 10 200 3200) 0.003)))
       (z (DelayN s 0.048 0.048))
       (y (Mix (CombL z 0.1 (MulAdd (LfNoise1N 7 (Rand 0 0.1)) 0.04 0.05) 15)))
       (x (iter 4 (lambda (i) (AllpassN i 0.05 (RandN 2 0 0.05) 1)) y)))
  (Add s (Mul x 0.2)))
