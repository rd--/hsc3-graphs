; irand
(let ((f (IRand 60 72))
      (a (Line kr 0.1 0 0.1 removeSynth)))
  (Mul (FSinOsc ar (MIDICPS f) 0) a))
