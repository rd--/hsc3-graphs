; Dgeom ; Demand rate ugens are not shared
(let* ((a  (Dgeom 15 1 1.2))
       (t  (Impulse ar (MouseX kr 1 40 1 0.1) 0))
       (f0 (MulAdd (Demand (Delay1 t) 0 a) 30 340))
       (f1 (MulAdd (Demand t 0 a) 30 340)))
  (Mul (SinOsc ar (mce2 f0 f1) 0) 0.1))
