; lf-pulse
(let ((f (MulAdd (LFPulse kr 3 0 0.3) 200 200)))
  (Mul (LFPulse ar f 0 0.2) 0.05))
