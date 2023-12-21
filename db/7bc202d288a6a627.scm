; Gate
(let ((s (Mul (FSinOsc 500 0) 1/4))
      (t (LfPulse 1 0 1/10)))
  (Gate s t))
