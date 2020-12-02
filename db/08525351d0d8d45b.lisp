; pm-osc
(let ((f (line kr 600 900 5 remove-synth)))
  (mul (pm-osc ar f 600 3 0) 0.1))
