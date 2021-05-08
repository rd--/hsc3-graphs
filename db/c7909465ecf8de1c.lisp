; impulse
(let ((f (MouseY kr 4 8 0 0.1))
      (p (MouseX kr 0 1 0 0.1)))
  (Mul (Impulse ar f (mce2 0 p)) 0.1))
