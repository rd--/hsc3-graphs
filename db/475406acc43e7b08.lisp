; lorenz-l ; vary frequency
(let ((x (mouse-x kr 20 sample-rate 0 0.1)))
  (mul (lorenz-l ar x 10 28 2.667 0.05 0.1 0 0) 0.10))
