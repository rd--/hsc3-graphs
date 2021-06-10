; zizle (jmcc) #SC3d1.5 ; texture=overlap,4,4,12,inf
(let* ((a (lambda (f)
            (let ((frEQ (Mul f (Mce2 (Rand 0.7 1.3) 1)))
                  (ph (Mce2 (Rand 0 twoPi) (Rand 0 twoPi))))
              (Mix (Mul (SinOsc ar frEQ ph) 0.1)))))
       (a1 (Max (a (ExpRand 0.38 8)) 0))
       (a2 (Abs (a (ExpRand 6 24)))))
  (Pan2 (SinOsc ar (MIDICPS (Rand 24 108)) (Rand 0 twoPi)) (Rand2 1) (Mul a1 a2)))
