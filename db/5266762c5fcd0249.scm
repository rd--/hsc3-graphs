; ExpRand
(let ((f (ExpRand 100 8000))
      (a (Line 0.5 0 0.01 removeSynth)))
  (Mul (FSinOsc f 0) a))
