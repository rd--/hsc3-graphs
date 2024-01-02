; cymbalism accelerando (jmcc) #2 ; texture=overlap,4,4,4,inf
(let* ((y (lambda ()
            (let* ((f1 (Rand 500 2500))
                   (f2 (Rand 0 8000))
                   (f (replicateM 15 (lambda () (Rand f1 (Add f1 f2)))))
                   (rt (replicateM 15 (lambda () (Rand 1 5)))))
              (klankData f (replicate 15 1) rt))))
       (z (! y 2))
       (w (Mul (WhiteNoise) 0.02))
       (tf (XLine (LinRand 0.5 4.5 0) (Rand 0.5 35.5) 12 doNothing))
       (t (Impulse tf 0))
       (s (Mul (Decay t 0.004) w)))
  (Klank s 1 0 1 (Transpose z)))