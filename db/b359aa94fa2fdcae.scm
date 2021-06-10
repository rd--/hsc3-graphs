; synthetic piano (jmcc) #3
(mixFill 6
  (lambda (_)
    (let* ((n (IRand 36 90))
           (f (Rand 0.1 0.5))
           (ph (Rand 0 1))
           (s (Mul (Impulse ar f ph) 0.1))
           (e (Decay2 s 0.008 0.04))
           (c
            (lambda (i)
              (let* ((n0 (LFNoise2 ar 3000))
                     (o (list-ref (list -0.05 0 0.04) i))
                     (dt (FDiv 1 (MIDICPS (Add n o)))))
                (CombL (Mul n0 e) dt dt 6))))
           (l (Sub (FDiv (Sub n 36) 27) 1)))
      (Pan2 (mixFill 3 c) l 1))))
