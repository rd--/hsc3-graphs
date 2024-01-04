var freq = Duty(
	MouseX(0.001, 2, 1, 0.2),
	0,
	Dseq(inf, [204 400 201 502 300 200])
);
SinOsc(freq * [1 1.01], 0) * 0.1
