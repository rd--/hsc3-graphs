; sprinkler mouse (jmcc) #1
(let* ((f (MouseX 0.2 50 linear 0.2))
       (t (Mul (LFPulse f 0 0.25) 0.1)))
  (BPZ2 (Mul (WhiteNoise) t)))
