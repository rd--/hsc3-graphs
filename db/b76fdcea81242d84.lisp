; AllpassN ; an echo, similar to comb, output is inverted and has lower amplitude
(AllpassN (Mul (Decay (Dust ar 1) 0.2) (Mul (WhiteNoise ar) 0.05)) 0.2 0.2 3)
