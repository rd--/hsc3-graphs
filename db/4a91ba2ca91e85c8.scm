; lagin ; write and also read random values to control-bus
(let* ((b (ctl kr "bus" 0))
       (t (Dust kr 1))
       (f (TRand 200 8000 t)))
  (Mrg2 (Mul (SinOsc ar (LagIn 1 b 1) 0) 0.1)
        (Out b f)))
