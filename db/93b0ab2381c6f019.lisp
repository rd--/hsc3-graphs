; lf-clip-noise ; modulate frequency
(let ((f (x-line kr 1000 10000 10 remove-synth)))
  (mul (lf-clip-noise ar f) 0.025))
