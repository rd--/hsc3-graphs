; quad-c
(let ((r (mouse-x kr 3.5441 4 0 0.1)))
  (mul (sin-osc ar (mul-add (quad-c ar 4 (neg r) r 0 0.1) 800 900) 0) 0.1))
