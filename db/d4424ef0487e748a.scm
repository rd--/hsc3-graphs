; dgeom
(let* ((a0 (Dgeom 15 1 1.2))
       (a1 (Dgeom 15 1 1.2))
       (t  (Impulse ar (MouseX kr 1 40 1 0.1) 0))
       (f0 (MulAdd (Demand (Delay1 t) 0 a0) 30 340))
       (f1 (MulAdd (Demand t 0 a1) 30 340)))
  (Mul (SinOsc ar (mce2 f0 f1) 0) 0.1))
