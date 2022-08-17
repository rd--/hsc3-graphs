// waveform ; jmcc
[
	LFTri.ar(80, 0) * 0.2,
	CombN.ar(
		Resonz.ar(BrownNoise.ar * 0.4, MouseX.kr(20, 12000, 1, 0.2), 0.2),
		1 / 80,
		1 / 80,
		0.3
	) * SinOsc.ar(80, 1).abs
]
