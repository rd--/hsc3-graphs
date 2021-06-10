; PMOsc
(let ((i (Line kr 0 20 8 removeSynth)))
  (Mul (PMOsc ar 300 550 i 0) 0.1))
