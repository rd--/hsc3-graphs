; allpass-n ; an echo, similar to comb, output is inverted and has lower amplitude
(allpass-n (mul (decay (dust ar 1) 0.2) (mul (white-noise ar) 0.05)) 0.2 0.2 3)
