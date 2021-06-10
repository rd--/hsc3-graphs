; Resonz ; modulate frequency
(let ((f (XLine kr 1000 8000 10 removeSynth)))
  (Resonz (Mul (WhiteNoise ar) 0.1) f 0.05))
