; in ; patching input to output, with summed delay
(let ((i (mul (in 2 ar num-input-buses) 0.1)))
  (add i (delay-n i 0.5 0.5)))
