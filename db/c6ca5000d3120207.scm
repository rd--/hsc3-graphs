; dswitch1
(let* ((x (MouseX 0 4 0 0.1))
       (y (MouseY 1 15 0 0.1))
       (a (Dswitch1 x (asMce (list 1 3 y 2 (Dwhite 2 0 3)))))
       (t (Impulse 3 0))
       (f (MulAdd (Demand t 0 a) 30 340)))
  (Mul (SinOsc f 0) 0.1))
