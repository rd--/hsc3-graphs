; cps-oct
(let ((f (oct-cps (cps-oct (x-line kr 600 900 6 remove-synth)))))
  (mul (saw ar f) 0.05))
