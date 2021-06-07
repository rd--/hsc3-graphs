; pm-osc ; mce
(let ((i (Line kr 0 20 8 remove-synth)))
  (Mul (pm-osc ar (mce2 300 307) (mce2 550 553) i 0) 0.1))
