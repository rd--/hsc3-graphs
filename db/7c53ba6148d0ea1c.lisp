; pm-osc
(let ((i (line kr 0 20 8 remove-synth)))
  (mul (pm-osc ar 300 550 i 0) 0.1))
