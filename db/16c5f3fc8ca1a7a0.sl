let freq = DemandEnvGen(
	Dseq(2, [Dseries(5, 400, 200), 500, 800, 530, 4000, 900]),
	Dseq(inf, [0.2, 0.1, 0.2, 0.3, 0.1]),
	Dseq(inf, [1, 0, 0, 6, 1, 1, 0, 2]),
	0,
	MouseX(0, 1, 0, 0.2) > 0.5,
	MouseButton(0, 1, 0.2) > 0.5,
	1, 0, 1, 0
);
SinOsc(freq * [1, 1.001], 0) * 0.1
