; reverberated noise bursts (jmcc) #3
(let* ((useq (lambda (n f) (foldl1 compose (replicate n f))))
       (s (Mul (Decay (Mul (Dust ar 0.6) 0.2) 0.15) (PinkNoise ar)))
       (z (DelayN s 0.048 0.048))
       (y (mix (CombL z 0.1 (MulAdd (LFNoise1 kr (RRandN 6 0 0.1)) 0.04 0.05) 15)))
       (f (useq 4 (lambda (i) (AllpassN i 0.050 (RRandN 2 0 0.05) 1)))))
  (Add s (f y)))
