; cusp-n ; vary frequency
(let ((x (mouse-x kr 20 sample-rate 0 0.1)))
  (mul (cusp-n ar x 1.0 1.99 0) 0.05))
