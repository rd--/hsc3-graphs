; x-line
(let ((f (x-line kr 200 17000 10 remove-synth)))
  (mul (sin-osc ar f 0) 0.05))
