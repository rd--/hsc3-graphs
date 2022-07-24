; NumOutputBuses
(let ((bus (NumOutputBuses)))
  (Mul
   (Pulse 90 0.3)
   (Amplitude (Lag (In 1 bus) 0.1) 0.01 0.01)))
