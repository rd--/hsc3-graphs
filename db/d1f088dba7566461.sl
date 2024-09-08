let freq = DemandEnvGen(
	Dwhite(inf, 300, 1000).RoundTo(100),
	0.1,
	5,
	0.3,
	MouseX(0, 1, 0, 0.2) > 0.5 + 0.1,
	1, 1, 0, 1, 0
);
SinOsc(freq * [1 1.21] * MouseY(0.25, 2, 0, 0.2), 0) * 0.1
