; running-min
(let* ((t (impulse kr (mouse-x kr 0.5 4 1 0.1) 0))
       (f (mul-add (running-min (sub 2 (sin-osc kr 2 0)) t) 500 200)))
  (mul (sin-osc ar f 0) 0.1))
