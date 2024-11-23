/* Waveform ; Jmcc */
[
	LfTri(80, 0) * 0.2,
	CombN(
		Resonz(BrownNoise() * 0.4, MouseX(20, 12000, 1, 0.2), 0.2),
		1 / 80,
		1 / 80,
		0.3
	) * SinOsc(80, 1).Abs
]
