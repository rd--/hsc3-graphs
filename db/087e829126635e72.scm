; CuspN ; vary frequency
(let ((x (MouseX 20 (SampleRate) 0 0.1)))
  (Mul (CuspN x 1.0 1.99 0) 0.05))
