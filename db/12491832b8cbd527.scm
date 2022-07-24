; quadc
(let ((r (MouseX 3.5441 4 0 0.1)))
  (Mul (SinOsc (MulAdd (QuadC 4 (Neg r) r 0 0.1) 800 900) 0) 0.1))
