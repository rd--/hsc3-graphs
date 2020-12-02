; comb-n ; with negative feedback
(comb-n (mul (white-noise ar) 0.01) 0.01 (x-line kr 0.0001 0.01 20 remove-synth) -0.2)
