; nrand
(let ((f (Mul (NRand 1200 4000 2) (Mce2 2 5)))
      (a (Line 0.1 0 0.01 removeSynth)))
  (Mul (FSinOsc f 0) a))
