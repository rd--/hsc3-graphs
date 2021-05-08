; Dibrown ; c.f. dbrown
(let* ((a (Dibrown dinf 0 15 1))
       (t (Impulse kr (MouseX kr 1 40 1 0.1) 0))
       (f (MulAdd (Demand t 0 a) 30 340)))
  (Mul (SinOsc ar f 0) 0.05))
