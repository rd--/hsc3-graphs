; allpass-n ; the allpass delay has no audible effect as a resonator on steady state sound
(allpass-c (mul (white-noise ar) 0.05) 0.01 (x-line kr 0.0001 0.01 20 do-nothing) 0.2)
