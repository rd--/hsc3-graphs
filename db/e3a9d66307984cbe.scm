; peak
(let* ((p (Peak (Dust 20) (Impulse 0.4 0)))
       (f (MulAdd p 500 200)))
  (Mul (SinOsc f 0) 0.1))
