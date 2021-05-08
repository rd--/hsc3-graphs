; gate
(let ((s (Mul (FSinOsc ar 500 0) 1/4))
      (t (LFPulse ar 1 0 1/10)))
  (Gate s t))
