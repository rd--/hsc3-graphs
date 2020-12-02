; running-min
(let* ((t (impulse ar 2.0 0))
       (f (mul-add (running-min (sub 1 (dust ar 20)) t) 500 200)))
 (mul (sin-osc ar f 0) 0.1))
