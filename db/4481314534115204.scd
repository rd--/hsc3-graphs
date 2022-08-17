// LFNoise0
CombN.ar(
	LPF.ar(LFNoise0.ar(MouseX.kr(300, 2200, 0, 0.2) * [1, 1.1], LFPulse.kr(1, 0, 0.3) * 0.1), 800).abs,
	0.2,
	[0.2, 0.17],
	5
)
