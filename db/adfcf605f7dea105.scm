; CuspN ; mouse-controlled params
(let ((x (MouseX kr 0.9 1.1 1 0.1))
      (y (MouseY kr 1.8 2 1 0.1)))
  (Mul (CuspN ar (FDiv SampleRate 4) x y 0) 0.1))
