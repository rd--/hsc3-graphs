; numinputbuses
(let ((bus (Add NumOutputBuses NumInputBuses)))
 (Mrg2 (Out 0 (In 1 ar bus))
       (Out bus (Mul (SinOsc ar 440 0) 0.1))))
