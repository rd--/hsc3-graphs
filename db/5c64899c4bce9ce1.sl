let curveInterpolation = 5;
let list = { ExpRand(200, 1000) } ! 32;
let freq = DemandEnvGen(
	{ Dseq(inf, list.scramble) } ! 2,
	SampleDur() * MouseY(1, 3000, 1, 0.2),
	curveInterpolation,
	MouseX(-0.01, -4, 0, 0.2),
	1, 1, 1, 0, 1, 0
);
SinOsc(freq, 0) * 0.1
