; comb-l ; with negative feedback
(comb-l (mul (white-noise ar) 0.01) 0.01 (x-line kr 0.0001 0.01 20 remove-synth) -0.2)
