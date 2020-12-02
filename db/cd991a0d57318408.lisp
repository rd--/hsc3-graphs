; amp-comp ; compare sine with and without compensation
(let* ((x (mouse-x kr 300 15000 1 0.1))
       (y (mouse-y kr 0 1 0 0.1))
       (o (mul (sin-osc ar x 0) 0.1))
       (c (amp-comp kr x 300 0.333)))
  (mce2 (mul o y) (mul3 o (sub 1 y) c)))
