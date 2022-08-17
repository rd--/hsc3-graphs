// harmonic relations ; jmcc
RLPF.ar(
	LFPulse.ar(
		[MouseX.kr(60, 300, 0, 30) + 0.04, MouseY.kr(60, 300, 0, 30)],
		0,
		0.5
	) * 0.1 - 0.05,
	800
)
