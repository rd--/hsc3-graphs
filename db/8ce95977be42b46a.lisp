; lfd-noise ; unlike lf-noise0 does not quantize time steps at high frequencies
(mul (lfd-noise0 ar (x-line kr 1000 20000 10 remove-synth)) 0.1)
