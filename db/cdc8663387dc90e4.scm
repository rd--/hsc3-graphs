; tirand
(let ((f (MulAdd (TIRand 4 12 (Dust kr 10)) 150 (Mce2 0 1))))
  (Mul (SinOsc ar f 0) 0.05))
