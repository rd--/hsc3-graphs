; fb-sine-c ; increase phase multiplier
(let ((a (line kr 1 2 10 do-nothing)))
  (mul (fb-sine-c ar sample-rate 1 0 a 0.5 0.1 0.1) 0.1))
