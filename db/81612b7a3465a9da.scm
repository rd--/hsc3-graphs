; FSinOsc
(let ((f (XLine 200 4000 1 removeSynth)))
  (Mul (FSinOsc f 0) 0.25))
