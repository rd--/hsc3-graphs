; oct-cps
(let ((f (oct-cps (line kr 2 9 6 remove-synth))))
  (mul (saw ar f) 0.05))
