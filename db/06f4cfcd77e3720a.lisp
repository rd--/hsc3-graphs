; lf-clip-noise ; as frequency control
(let ((f (mul-add (lf-clip-noise kr 4) 200 600)))
  (mul (sin-osc ar f 0) 0.1))
