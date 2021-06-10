; lfdnoise ; unlike LFNoise0 does not quantize time steps at high frequencies
(Mul (LFDNoise0 ar (XLine kr 1000 20000 10 removeSynth)) 0.1)
