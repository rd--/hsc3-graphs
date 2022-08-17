// waveform ; jmcc
[
	LFTri.ar(80, 0) * 0.2,
	CombN.ar(
		OnePole.ar(BrownNoise.ar * 0.1, MouseX.kr(0, 1, 0, 0.2)),
		1 / 80,
		1 / 80,
		0.3
	) * SinOsc.ar(80.04, 0.5 * pi).abs
]
