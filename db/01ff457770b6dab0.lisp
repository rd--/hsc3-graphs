; quadc
(let ((r (MouseX kr 3.5441 4 0 0.1)))
  (Mul (SinOsc ar (MulAdd (QuadC ar 4 (Neg r) r 0 0.1) 800 900) 0) 0.1))
