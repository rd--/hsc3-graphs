; CuspN ; mouse controlled params
(let ((x (MouseX 0.9 1.1 1 0.1))
      (y (MouseY 1.8 2 1 0.1)))
  (Mul (CuspN (Fdiv (SampleRate) 4) x y 0) 0.1))
