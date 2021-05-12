; Resonz ; modulate bandwidth opposite direction
(let ((rq (XLine kr 0.001 1 8 remove-synth)))
  (Resonz (Mul (WhiteNoise ar) 0.1) 2000 rq))
