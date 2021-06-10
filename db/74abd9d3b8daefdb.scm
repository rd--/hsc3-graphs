; leakdc
(let ((a (Mul (LFPulse ar 800 0.5 0.5) 0.025)))
  (Mce2 a (LeakDC a 0.995)))
