; free-verb ; c.f. free-verb2
(let* ((i (impulse ar 1 0))
       (c (lf-cub ar 1200 0))
       (s (mul3 (decay i 0.25) c 0.1))
       (x (mouse-x kr 0 1 0 0.1))
       (y (mouse-y kr 0 1 0 0.1)))
  (mce2 s (free-verb s y x 0.5)))
