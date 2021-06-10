; PMOsc
(let ((f (Line kr 600 900 5 removeSynth)))
  (Mul (PMOsc ar f 600 3 0) 0.1))
