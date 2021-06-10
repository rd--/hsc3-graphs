; exprand
(let ((f (ExpRand 100 8000))
      (a (Line kr 0.5 0 0.01 removeSynth)))
  (Mul (FSinOsc ar f 0) a))
