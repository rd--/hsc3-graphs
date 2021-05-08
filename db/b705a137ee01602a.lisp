; inrange
(let ((a (InRange (Mul (SinOsc kr 1 0) 0.2) -0.15 0.15)))
  (Mul a (Mul (BrownNoise ar) 0.1)))
