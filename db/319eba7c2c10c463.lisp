; allpass-n
(let ((z (mul (white-noise ar) 0.05)))
  (add z (allpass-c z 0.01 (x-line kr 0.0001 0.01 20 do-nothing) 0.2)))
