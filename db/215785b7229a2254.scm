; leakdc
(let ((a (Mul (LFPulse ar 800 0.5 0.5) 0.025)))
  (mce2 a (LeakDC a 0.995)))
