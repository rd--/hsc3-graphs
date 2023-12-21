// Tw 14 Nov 2022 Ballad ; https://github.com/lukiss/Losers-Union-SC-Research
var d = Dseq((1, 3 .. 21), inf);
var f = Ddup(
	LFPar.ar(0.05, 0) * d / [3, 7, 5, 1],
	Dseq((9 .. 42).degreeToKey(Scale.phrygian, 12), inf).midicps
);
Splay.ar(
	LeakDC.ar(
		GrainFM.ar(
			2,
			TDuty.ar(1 / d, 0, 1, 0, 0),
			2 + LFPar.ar(0.3, 0) / d * 2,
			[2, 3],
			f,
			f % d / 12,
			LFPar.ar(440, 0) / 2,
			Buffer.sendCollection(s, Env.perc.discretize(1024)),
			512
		) * 0.23,
		0.995
	)
).sum
