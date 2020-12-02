; running-max
(let* ((t (impulse ar 0.4 0))
       (f (mul-add (running-max (dust ar 20) t) 500 200)))
  (mul (sin-osc ar f 0) 0.1))
