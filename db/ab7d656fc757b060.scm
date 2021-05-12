; peak
(let* ((p (Peak (Dust ar 20) (Impulse ar 0.4 0)))
       (f (MulAdd p 500 200)))
  (Mul (SinOsc ar f 0) 0.1))
