; CuspN ; frequency control
(let* ((x (MouseX kr 0.9 1.1 1 0.1))
       (y (MouseY kr 1.8 2 1 0.1))
       (f (MulAdd (CuspN ar 40 x y 0) 800 900)))
  (Mul (SinOsc ar f 0.0) 0.1))
