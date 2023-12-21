; why supercollider (jmcc) #0
(let* ((s (!+ (lambda () (Resonz (Mul (Dust 0.2) 50) (Rand 200 3200) 0.003)) 10))
       (z (DelayN s 0.048 0.048))
       (y (!+ (lambda () (CombL z 0.1 (MulAdd (LfNoise1 (Rand 0 0.1)) 0.04 0.05) 15)) 7))
       (x (iter 4 (lambda (i) (AllpassN i 0.05 (RandN 2 0 0.05) 1)) y)))
  (Add s (Mul x 0.2)))
