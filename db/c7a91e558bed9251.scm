; NumInputBuses
(let ((bus (Add (NumOutputBuses) (NumInputBuses))))
  (Mrg2
   (In 1 bus)
   (Out bus (Mul (SinOsc 440 0) 0.1))))
