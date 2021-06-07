; pm-osc ; nested mce
(let ((i (Line kr 0 20 8 remove-synth)))
  (mix (Mul (pm-osc ar (mce2 (mce2 300 411) (mce2 307 415)) (mce2 550 553) i 0) 0.1)))
