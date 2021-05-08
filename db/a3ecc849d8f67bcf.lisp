; Diwhite ; c.f. dwhite
(let* ((a (Diwhite dinf 0 15))
       (t (Impulse kr (MouseX kr 1 40 1 0.1) 0))
       (f (MulAdd (Demand t 0 a) 30 340)))
  (Mul (SinOsc ar f 0) 0.1))
