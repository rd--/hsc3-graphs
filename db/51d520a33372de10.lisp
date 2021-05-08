; reverberated sine percussion (jmcc) #3
(let* ((rallpass (lambda (i) (AllpassN i 0.050 (RRandN 3 0 0.05) 1)))
       (chain-of (lambda (n f) (foldl1 compose (replicate n f))))
       (d 10)
       (c 7)
       (a 4)
       (s (mix-fill
           d
           (lambda (_)
             (Resonz (Mul (Dust ar (/ 2 d)) 50)
                     (Rand 200 3200)
                     0.003))))
       (z (DelayN s 0.048 0.48))
       (y (mix (CombL z
                       0.1
                       (MulAdd (LFNoise1 kr (RRandN c 0 0.1))
                                0.04
                                0.05)
                       15)))
       (x ((chain-of a rallpass) y)))
  (Add s (Mul 0.2 x)))
