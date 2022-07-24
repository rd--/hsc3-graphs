; In ; write and also read random values to control-bus
(let* ((b (ctl "bus" 0))
       (t (Dust 2))
       (f (TRand 200 500 t)))
  (Mrg2 (Mul (SinOsc (In 1 b) 0) 0.1)
        (Out b f)))
