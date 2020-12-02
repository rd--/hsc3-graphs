; last-value
(let ((f (last-value (mouse-x kr 100 400 0 0.1) 40)))
 (mul (sin-osc ar f 0) 0.1))
