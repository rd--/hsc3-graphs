; amp-comp-a
(let* ((x (mouse-x kr 300 15000 1 0.1))
       (y (mouse-y kr 0 1 0 0.1))
       (o (mul (sin-osc ar x 0) 0.1))
       (c (amp-comp-a kr x 300 (db-amp -10) 1)))
  (mce2 (mul o y) (mul3 o (sub 1 y) c)))
