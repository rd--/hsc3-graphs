; standard-l
(let ((f (f-div sample-rate 2))
      (x (mouse-x kr 0.9 4 0 0.1)))
  (mul (standard-l ar f x 0.5 0) 0.05))
