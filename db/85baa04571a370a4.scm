; PMOsc
(let ((mf (Line kr 600 900 5 removeSynth)))
  (Mul (PMOsc ar 300 mf 3 0) 0.1))
