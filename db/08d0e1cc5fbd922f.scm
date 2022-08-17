; Sqrt
(let* ((a (Ln -2 2 3))
       (b (Sqrt a))
       (f (MulAdd (list a b) 600 900)))
  (Mul (SinOsc f 0) 0.05))
