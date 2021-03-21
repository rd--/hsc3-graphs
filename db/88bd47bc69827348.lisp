; harmonic swimming (jmcc) #1
(let* ((a 0.02)
       (f 50)
       (p 20)
       (z 0)
       (l (Line 0 (- a) 60 0))
       (o (lambda (h)
            (let* ((r (mce-fill 2 (lambda (_) (s:rand 2 8))))
                   (n (LFNoise1 r))
                   (e (Max 0 (MulAdd n a l))))
              (mul (FSinOsc (* f (+ h 1)) 0) (KR e))))))
  (mix-fill p o))