let freq = XLine(100, 3000, 10);
[
	Ringz(WhiteNoise() * 0.005, freq, 0.5),
	Ringz(Impulse(6, 0) * 0.1, freq, 0.5)
]
