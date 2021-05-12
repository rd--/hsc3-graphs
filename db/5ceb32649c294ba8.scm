; pm-osc
(let ((mf (Line kr 600 900 5 remove-synth)))
  (Mul (pm-osc ar 300 mf 3 0) 0.1))
