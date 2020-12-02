; num-input-buses
(let ((bus (add num-output-buses num-input-buses)))
 (mrg2 (out 0 (in 1 ar bus))
       (out bus (mul (sin-osc ar 440 0) 0.1))))
