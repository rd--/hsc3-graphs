(* 30 Apr. 2020 ; https://github.com/lukiss/Losers-Union-SC-Research *)
let t = {
	TDuty(Drand(inf, (1 .. 8) / 16), 0, 1)
};
let r = { :lo :hi |
	TRand(lo, hi, t())
};
Normalizer(
	CompanderD(
		LeakDc(
			LorenzL(
				22050,
				r(19, 11),
				r(1, 18),
				r(0.1, 5),
				r(0.01, 0.06 ! 2),
				0.1,
				0,
				0
			),
			0.995
		),
		0.8,
		r(0.01, 0.5),
		r(0.01, 0.5),
		0.01,
		0.075
	),
	-2.DbAmp,
	0.02
).Fold2(0.8)
