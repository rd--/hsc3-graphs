; CuspN ; vary frequency
(let ((x (MouseX kr 20 SampleRate 0 0.1)))
  (Mul (CuspN ar x 1.0 1.99 0) 0.05))
