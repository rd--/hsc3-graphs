; In ; write and also read random values to control-bus
(let* ((b (ctl kr "bus" 0))
       (t (Dust kr 2))
       (f (TRand 200 500 t)))
  (mrg2 (Mul (SinOsc ar (In 1 kr b) 0) 0.1)
        (Out b f)))
