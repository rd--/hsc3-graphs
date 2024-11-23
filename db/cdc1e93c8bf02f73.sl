/* Waveform ; Jmcc */
[
	LfTri(80, 0) * 0.2,
	CombN(
		OnePole(BrownNoise() * 0.1, MouseX(0, 1, 0, 0.2)),
		1 / 80,
		1 / 80,
		0.3
	) * SinOsc(80.04, 0.5 * pi).Abs
]
