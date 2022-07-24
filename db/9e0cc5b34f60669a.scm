; PMOsc ; mce
(let ((i (Line 0 20 8 removeSynth)))
  (Mul (PMOsc (Mce2 300 307) (Mce2 550 553) i 0) 0.1))
