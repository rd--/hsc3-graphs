; peak
(let* ((p (peak (dust ar 20) (impulse ar 0.4 0)))
       (f (mul-add p 500 200)))
  (mul (sin-osc ar f 0) 0.1))
