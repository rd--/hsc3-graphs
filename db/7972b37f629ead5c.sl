let cubicInterpolation = 7;
let freq = DemandEnvGen(
	Dseq(inf, [204 400 201 502 300 200]),
	Drand(inf, [1.01 0.2 0.1 2]) * MouseY(0.01, 3, 1, 0.2),
	cubicInterpolation,
	0, 1, 1, 1, 0, 1, 0
);
SinOsc(freq * [1 1.01], 0) * 0.1
