var snd = Bpf(WhiteNoise(), 1000, 0.001);
[FreqShift(snd, LfNoise0(5.5) * 1000, 0) * 4, snd]
