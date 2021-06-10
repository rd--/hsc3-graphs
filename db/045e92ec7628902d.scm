; PMOsc ; nested mce
(let ((i (Line kr 0 20 8 removeSynth)))
  (Mix (Mul (PMOsc ar (Mce2 (Mce2 300 411) (Mce2 307 415)) (Mce2 550 553) i 0) 0.1)))
