; limiter
(let* ((t (Impulse ar 8 (Mul (LFSaw kr 0.25 -0.6) 0.7)))
       (i (Mul (Decay2 t 0.001 0.3) (FSinOsc ar 500 0))))
  (Mce2 (Mul i 0.1) (Limiter i 0.2 0.01)))
