; standardl
(let ((f (FDiv SampleRate 2))
      (x (MouseX kr 0.9 4 0 0.1)))
  (Mul (StandardL ar f x 0.5 0) 0.05))
