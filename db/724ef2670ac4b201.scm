; Resonz ; modulate bandwidth
(let ((rq (XLine 1 0.001 8 removeSynth)))
  (Resonz (Mul (WhiteNoise) 0.1) 2000 rq))
