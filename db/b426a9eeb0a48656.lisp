; lag-in ; write and also read random values to control-bus
(let* ((b (ctl kr "bus" 0))
       (t (dust kr 1))
       (f (t-rand 200 8000 t)))
  (mrg2 (mul (sin-osc ar (lag-in 1 kr b 1) 0) 0.1)
        (out b f)))
