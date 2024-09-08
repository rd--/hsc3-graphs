DemandEnvGen(
	Dseq(inf, [Dseries(20, -0.1, 0.01)]),
	SampleDur() * MouseY(1, 100, 1, 0.2),
	1,
	0,
	K2A(1),
	Impulse(MouseX(1, SampleRate() * MouseX(0.002, 1, 1, 0.2), 1, 0.2), 0) + [0, 0.3],
	1, 0, 1, 0
)
