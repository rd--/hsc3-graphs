var freq = Duty(
	Drand(inf, [0.01 0.2 0.4]),
	0,
	Dseq(inf, [204 400 201 502 300 200])
).Lag(0.2);
SinOsc(freq * [1 1.01], 0) * 0.1
