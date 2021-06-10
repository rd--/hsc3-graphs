; PMOsc ; mce
(let ((i (Line kr 0 20 8 removeSynth)))
  (Mul (PMOsc ar (Mce2 300 307) (Mce2 550 553) i 0) 0.1))
