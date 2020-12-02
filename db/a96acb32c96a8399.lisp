; in-range
(let ((a (in-range (mul (sin-osc kr 1 0) 0.2) -0.15 0.15)))
  (mul a (mul (brown-noise ar) 0.1)))
