; CuspL ; see CuspN
(let ((x (MouseX kr 20 SampleRate 0 0.1)))
  (Mul (CuspL ar x 1.0 1.99 0) 0.05))
