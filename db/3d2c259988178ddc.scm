; Resonz ; modulate bandwidth opposite direction
(let ((rq (XLine 0.001 1 8 removeSynth)))
  (Resonz (Mul (WhiteNoise) 0.1) 2000 rq))
