; impulse
(let ((f (mouse-y kr 4 8 0 0.1))
      (p (mouse-x kr 0 1 0 0.1)))
  (mul (impulse ar f (mce2 0 p)) 0.1))
