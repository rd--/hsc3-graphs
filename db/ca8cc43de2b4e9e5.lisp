; stepper
(let ((x (mouse-x kr (- 3) 4 do-nothing 0.1)))
  (mul (sin-osc ar (mul (stepper (impulse kr 10 0) 0 4 16 x 0) 100) 0) 0.05))
