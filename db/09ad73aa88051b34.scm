; dser
(let* ((a (Dser dinf (asMce (list 1 3 2 7 8))))
       (x (MouseX kr 1 40 1 0.1))
       (t (Impulse kr x 0))
       (f (MulAdd (Demand t 0 a) 30 340)))
  (Mul (SinOsc ar f 0) 0.1))
