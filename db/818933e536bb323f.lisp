; amp-comp ; amplitude compensation in frequency modulation
(let* ((x (mouse-x kr 300 15000 1 0.1))
       (y (mouse-y kr 3 200 1 0.1))
       (m (mul x (mul-add (sin-osc ar y 0) 0.5 1)))
       (a (amp-comp kr m 300 0.333)))
  (mul3 (sin-osc ar m 0) 0.1 a))
