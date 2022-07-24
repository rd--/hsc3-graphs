; stepper
(let ((x (MouseX (- 3) 4 0 0.1)))
  (Mul (SinOsc (Mul (Stepper (Impulse 10 0) 0 4 16 x 0) 100) 0) 0.05))
