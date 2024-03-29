; sidereal time (jmcc) #9 ; texture=overlap,4,4,6,inf
(let* ((p 15)
       (z (let ((mk-y (lambda ()
                        (let ((fr (ExpRandN p 100 6000))
                              (rt (RandN p 2 6)))
                          (klankData fr (replicate p 1) rt)))))
            (! mk-y 2)))
       (f (XLn (ExpRand 40 300) (ExpRand 40 300) 12))
       (t (let ((e (LfNoise2 (Rand 0 8))))
            (Mul (Mul (LfPulse f 0 (Rand 0.1 0.9)) 0.002) (Max 0 e))))
       (o (Mul (Distort (Klank t 1 0 1 (transpose z))) 0.1)))
  (Add (CombN o 0.6 (Rand 0.1 0.6) 8) (reverse o)))
