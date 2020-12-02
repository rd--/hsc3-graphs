; amp-comp ; modulate exponent
(let* ((x (mouse-x kr 300 15000 1 0.1))
       (o (mul (pulse ar x 0.5) 0.05)))
  (mul o (amp-comp kr x 300 1.3)))
