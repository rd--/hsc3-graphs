; In ; patching input to output, with summed delay
(let ((i (Mul (In 2 (NumInputBuses)) 0.1)))
  (Add i (DelayN i 0.5 0.5)))
