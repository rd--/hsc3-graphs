; Dbrown
(let* ((a (Dbrown dinf 0 15 1))
       (t (Impulse (MouseX 1 40 1 0.1) 0))
       (f (MulAdd (Demand t 0 a) 30 340)))
  (Mul (SinOsc f 0) 0.05))
