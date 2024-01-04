(* Tw 14 Nov 2022 Ballad ; https://github.com/lukiss/Losers-Union-SC-Research *)
var d = Dseq(inf, [1, 3 .. 21]);
var f = Ddup(
	LfPar(0.05, 0) * d / [3 7 5 1],
	Dseq(inf, [9 .. 42].degreeToKey([0 1 3 5 7 8 10], 12)).MidiCps
);
var n = 8;
LeakDc(
	GrainFm(
		n,
		TDuty(1 / d, 0, 1),
		2 + LfPar(0.3, 0) / d * 2,
		[2 3],
		f,
		f % d / 12,
		LfPar(440, 0) / 2,
		-1, (* Cannot be LocalBuf, Env.perc.discretize *)
		512
	).Splay * 0.23,
	0.995
).Sum
