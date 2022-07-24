; tirand
(let ((f (MulAdd (TIRand 4 12 (Dust 10)) 150 (Mce2 0 1))))
  (Mul (SinOsc f 0) 0.05))
