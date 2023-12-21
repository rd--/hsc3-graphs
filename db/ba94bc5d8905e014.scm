; reverberated sine percussion (jmcc) #3
(let* ((rAllpass (lambda (i) (AllpassN i 0.050 (RandN 2 0 0.05) 1)))
       (s (!+
           (lambda ()
             (Resonz (Mul (Dust 2/10) 50)
                     (Rand 200 3200)
                     0.003))
	   10))
       (z (DelayN s 0.048 0.48))
       (y (Mix (CombL z
                      0.1
                      (MulAdd (LfNoise1 (RandN 7 0 0.1))
                              0.04
                              0.05)
                      15)))
       (x (iter 4 rAllpass y)))
  (Add s (Mul 0.2 x)))
