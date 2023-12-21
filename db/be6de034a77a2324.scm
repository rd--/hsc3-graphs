; 20061030 (rd)
(let* ((t (Dust (Mce2 12 18)))
       (f0 (TRand 1 64 t))
       (f1 (LfNoise0 f0))
       (a  (TRand 0.0 0.5 t))
       (dt (TRand 0.975 1.025 t))
       (dh (TRand 0.750 0.7505 t))
       (f (MulAdd f1 (Mce2 9000 12000) 9500))
       (o (Add3 (Saw f) (Saw (Mul f dh)) (Saw (Mul f dt)))))
  (Clip2 (Mul o a) 0.75))
