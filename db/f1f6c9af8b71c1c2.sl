let in = Pulse([40 121], [0.3 0.7]) * 0.4;
let freq = SinOsc(
	LfNoise0(0.42).LinLin(-1, 1, 0.01, 2.2),
	0
).LinLin(-1, 1, 30, 4200);
MoogFf(in, freq, 0.83 * 4, 0) * 0.5
