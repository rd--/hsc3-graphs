; InRange
(let ((a (InRange (Mul (SinOsc 1 0) 0.2) -0.15 0.15)))
  (Mul a (Mul (BrownNoise) 0.1)))
