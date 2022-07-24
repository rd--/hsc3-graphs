; IRand
(let ((f (IRand 200 1200))
      (a (Line 0.1 0 0.1 removeSynth)))
  (Mul (FSinOsc f 0) a))
