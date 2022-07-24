; Gate
(let ((s (Mul (FSinOsc 500 0) 1/4))
      (t (LFPulse 1 0 1/10)))
  (Gate s t))
