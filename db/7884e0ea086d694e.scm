; standardl
(let ((f (Fdiv (SampleRate) 2))
      (x (MouseX 0.9 4 0 0.1)))
  (Mul (StandardL f x 0.5 0) 0.05))
