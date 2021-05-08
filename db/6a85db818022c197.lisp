; stepper
(let ((x (MouseX kr (- 3) 4 do-nothing 0.1)))
  (Mul (SinOsc ar (Mul (Stepper (Impulse kr 10 0) 0 4 16 x 0) 100) 0) 0.05))
