; pm-osc
(let ((f (Line kr 600 900 5 remove-synth)))
  (Mul (pm-osc ar f 600 3 0) 0.1))
