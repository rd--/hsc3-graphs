; LfPulse
(let ((f (MulAdd (LfPulse 3 0 0.3) 200 200)))
  (Mul (LfPulse f 0 0.2) 0.05))
