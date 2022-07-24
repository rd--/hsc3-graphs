; mostchange
(let* ((x (MouseX 200 300 0 0.1))
       (f (MostChange (MulAdd (LFNoise0 1) 400 900) x)))
  (Mul (SinOsc f 0) 0.1))
