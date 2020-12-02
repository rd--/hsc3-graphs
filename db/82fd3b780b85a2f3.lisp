; running-max
(let* ((t (impulse kr (mouse-x kr 0.01 2 1 0.1) 0))
       (f (mul-add (running-max (sin-osc kr 2 0) t) 500 200)))
  (mul (sin-osc ar f 0) 0.1))
