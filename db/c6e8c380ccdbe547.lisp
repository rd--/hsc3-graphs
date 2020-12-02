; cusp-n ; mouse-controlled params
(let ((x (mouse-x kr 0.9 1.1 1 0.1))
      (y (mouse-y kr 1.8 2 1 0.1)))
  (mul (cusp-n ar (f-div sample-rate 4) x y 0) 0.1))
