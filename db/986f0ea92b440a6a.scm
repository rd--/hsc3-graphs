; harmonic swimming (jmcc) #1
(let* ((a 0.02)
       (f 50)
       (p 20)
       (z 0)
       (l (Line kr 0 (Neg a) 60 0))
       (o (lambda (h)
            (let* ((r (RRandN 2 2 8))
                   (n (LFNoise1 kr r))
                   (e (Max 0 (MulAdd n a l))))
              (Mul (FSinOsc ar (* f (+ h 1)) 0) e)))))
  (mix-fill p o))
