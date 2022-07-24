; CuspN ; frequency control
(let* ((x (MouseX 0.9 1.1 1 0.1))
       (y (MouseY 1.8 2 1 0.1))
       (f (MulAdd (CuspN 40 x y 0) 800 900)))
  (Mul (SinOsc f 0.0) 0.1))
