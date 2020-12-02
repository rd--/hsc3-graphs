; lfd-clip-noise ; lf-clip-noise quantizes time steps at high freqs, lfd-clip-noise does not
(let ((f (x-line kr 1000 20000 10 remove-synth)))
  (mul (lfd-clip-noise ar f) 0.05))
