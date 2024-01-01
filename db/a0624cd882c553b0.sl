var freq = DmdFor(
	Drand(inf, [0.01 0.2 0.4]),
	0,
	Dseq(inf, [204 400 201 502 300 200])
);
SinOsc(freq * [1 1.01], 0) * 0.1
