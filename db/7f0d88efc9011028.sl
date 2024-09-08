let freq = DemandEnvGen(
	{ Dseq(inf, [300, 800, Drand(1, [1000, 460, 300]), 400]) + Rand(0, 3) } ! 2,
	MouseY(0.001, 2, 1, 0.2),
	5,
	-4,
	MouseX(0, 1, 0, 0.2) > 0.5,
	1, 1, 0, 1, 0
);
SinOsc(freq, 0) * 0.1
