; Impulse
(let ((f (MouseY 4 8 0 0.1))
      (p (MouseX 0 1 0 0.1)))
  (Mul (Impulse f (Mce2 0 p)) 0.1))
