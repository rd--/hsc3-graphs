; irand
(let ((f (IRand 200 1200))
      (a (Line kr 0.1 0 0.1 remove-synth)))
  (Mul (FSinOsc ar f 0) a))