; harmonic swimming (jmcc) #1
(let* ((a 0.02)
       (l (Ln 0 (- a) 60))
       (o (lambda (h)
            (let* ((r (! (lambda () (Rand 2 8)) 2))
                   (n (LfNoise1 r))
                   (e (Max 0 (MulAdd n a l))))
              (Mul (FSinOsc (* 50 h) 0) (kr: e))))))
  (mixFillOneIndexed 20 o))
