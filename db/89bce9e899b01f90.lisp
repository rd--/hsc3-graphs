; in ; write and also read random values to control-bus
(let* ((b (ctl kr "bus" 0))
       (t (dust kr 2))
       (f (t-rand 200 500 t)))
  (mrg2 (mul (sin-osc ar (in 1 kr b) 0) 0.1)
        (out b f)))
