; resonz ; modulate bandwidth opposite direction
(let ((rq (x-line kr 0.001 1 8 remove-synth)))
  (resonz (mul (white-noise ar) 0.1) 2000 rq))
