var freq = DmdFor(
	Dseq(inf, [0.2, 0.3, 0.4, Dseq(inf, [1 1 1 2 1 2])]) / 2,
	Dseq(inf, [1 2 4 5]),
	Dseq(inf, [0, 1, 2, Dseq(inf, [1 .. 5])])
) * 30 + 250;
SinOsc(freq * [1 1.01], 0) * 0.1
