; pm-osc
(let ((i (Line kr 0 20 8 remove-synth)))
  (Mul (pm-osc ar 300 550 i 0) 0.1))
