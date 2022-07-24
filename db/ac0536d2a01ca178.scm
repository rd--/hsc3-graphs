; linrand
(let ((f (LinRand 200 10000 (Mce2 -1 1)))
      (a (Line 0.1 0 0.01 removeSynth)))
  (Mul (FSinOsc f 0) a))
