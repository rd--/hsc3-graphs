; logistic ; explore via mouse
(let ((x (mouse-x kr 3 3.99 0 0.1))
      (y (mouse-y kr 10 10000 exponential 0.1)))
  (mul (logistic ar x y 0.25) 0.1))
