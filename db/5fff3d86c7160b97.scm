; Resonz ; modulate frequency
(let ((f (XLine 1000 8000 10 removeSynth)))
  (Resonz (Mul (WhiteNoise) 0.1) f 0.05))
