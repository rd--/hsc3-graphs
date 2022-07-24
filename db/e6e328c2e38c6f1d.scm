; Logistic ; explore via mouse
(let ((x (MouseX 3 3.99 0 0.1))
      (y (MouseY 10 10000 exponential 0.1)))
  (Mul (Logistic x y 0.25) 0.1))
