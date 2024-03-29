; reverberated noise bursts (jmcc) #3
(let* ((s (Mul (Decay (Mul (Dust 0.6) 0.2) 0.15) (PinkNoise)))
       (z (DelayN s 0.048 0.048))
       (y (Mix (CombL z 0.1 (MulAdd (LfNoise1 (RandN 6 0 0.1)) 0.04 0.05) 15)))
       (f (lambda (i) (AllpassN i 0.050 (RandN 2 0 0.05) 1))))
  (Add s (iter 4 f y)))
