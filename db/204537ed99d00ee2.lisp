; cusp-l ; see cusp-n
(let ((x (mouse-x kr 20 sample-rate 0 0.1)))
  (mul (cusp-l ar x 1.0 1.99 0) 0.05))
