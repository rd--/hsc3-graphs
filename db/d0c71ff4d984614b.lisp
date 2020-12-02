; oct-cps
(let ((f (oct-cps (u:round (line kr 2 9 6 remove-synth) (/ 1 12)))))
  (mul (saw ar f) 0.05))
