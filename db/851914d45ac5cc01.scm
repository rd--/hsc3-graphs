; f-sin-osc
(let ((f (XLine kr 200 4000 1 removeSynth)))
  (Mul (FSinOsc ar f 0) 0.25))
