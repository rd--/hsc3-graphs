; lf-clip-noise
(let ((f (mul-add (lf-clip-noise ar (mouse-x kr 0.1 1000 1 0.1)) 200 500)))
  (mul (sin-osc ar f 0) 0.1))
