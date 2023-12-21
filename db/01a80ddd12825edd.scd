// 30 Apr. 2020 ; https://github.com/lukiss/Losers-Union-SC-Research
var t = {
	TDuty.kr(Drand((1 .. 8) / 16, inf), 0, 1)
};
var r = { | lo hi |
	TRand.kr(lo, hi, t);
};
Normalizer.ar(
	CompanderD.ar(
		LeakDC.ar(
			LorenzL.ar(
				22050,
				r.(19, 11),
				r.(1, 18),
				r.(0.1, 5),
				r.(0.01, 0.06 ! 2),
				0.1,
				0,
				0
			),
			0.995
		),
		0.8,
		r.(0.01, 0.5),
		r.(0.01, 0.5),
		0.01,
		0.075
	),
	-2.dbamp,
	0.02
).fold2(0.8)
