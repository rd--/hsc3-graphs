; lf-clip-noise ; not quantization at high frequencies, c.f. lfd-clip-noise
(let ((f (x-line kr 1000 20000 10 remove-synth)))
  (mul (lf-clip-noise ar f) 0.05))
