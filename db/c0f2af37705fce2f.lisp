; pm-osc
(let ((mf (line kr 600 900 5 remove-synth)))
  (mul (pm-osc ar 300 mf 3 0) 0.1))
