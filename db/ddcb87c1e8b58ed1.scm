; LagIn ; write and also read random values to control-bus
(let* ((b (ctl "bus" 0))
       (t (Dust 1))
       (f (TRand 200 8000 t)))
  (Mrg2
   (Mul (SinOsc (LagIn 1 b 1) 0) 0.1)
   (CtlOut b f)))
