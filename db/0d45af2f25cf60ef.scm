; linrand
(let ((f (LinRand 200 10000 (Mce2 -1 1)))
      (a (Line kr 0.1 0 0.01 removeSynth)))
  (Mul (FSinOsc ar f 0) a))
