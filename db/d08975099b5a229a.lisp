; nrand
(let ((f (Mul (NRand 1200 4000 2) (mce2 2 5)))
      (a (Line kr 0.1 0 0.01 remove-synth)))
  (Mul (FSinOsc ar f 0) a))
