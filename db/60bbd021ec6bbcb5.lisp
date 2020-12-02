; resonz ; modulate bandwidth
(let ((rq (x-line kr 1 0.001 8 remove-synth)))
  (resonz (mul (white-noise ar) 0.1) 2000 rq))
