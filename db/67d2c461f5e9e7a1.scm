; Resonz ; modulate bandwidth
(let ((rq (XLine kr 1 0.001 8 removeSynth)))
  (Resonz (Mul (WhiteNoise ar) 0.1) 2000 rq))
