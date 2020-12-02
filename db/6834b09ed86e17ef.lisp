; resonz ; modulate frequency
(let ((f (x-line kr 1000 8000 10 remove-synth)))
  (resonz (mul (white-noise ar) 0.1) f 0.05))
