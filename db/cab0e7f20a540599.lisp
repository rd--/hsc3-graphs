; sin-osc ; c.f. lf-cub
(let ((f (mul-add (sin-osc kr (mul-add (sin-osc kr 0.2 0) 8 10) 0) 400 800)))
  (mul (sin-osc ar f 0) 0.1))
