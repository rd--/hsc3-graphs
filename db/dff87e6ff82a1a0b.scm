; harmonic swimming (jmcc) #1
(let* ((a 0.02)
       (l (Line 0 (- a) 60 0))
       (o (lambda (h)
            (let* ((r (mceFill 2 (lambda (_) (Rand 2 8))))
                   (n (LFNoise1 r))
                   (e (Max 0 (MulAdd n a l))))
              (Mul (FSinOsc (* 50 h) 0) (kr: e))))))
  (mixFillOneIndexed 20 o))
