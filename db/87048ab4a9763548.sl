{- https://sonomu.club/@lukiss/113007186778241483 -}
let k = 0.13;
let l = { :a :b |
	k := k + k;
	LatoocarfianN(k, 1, 3, k, 0.5, 0.5, 0.5).Tanh.LinLin(-1, 1, a, b)
};
let d = {
	Decay2(
		TDuty(1 / 8, 0, 1),
		l(0.01, 1 / 9),
		l(0.1, 1)
	)
};
Normalizer(
	LeakDc(
		MoogFf(
			LorenzL(
				20000,
				l(21, 4),
				l(6, 17),
				l(0.003, 1 / 5),
				d().Clip(0, 0.05),
				0.1,
				0,
				0
			) ! 2,
			l(9, d() * l(9, 20000)) + 999,
			2 + d(),
			0
		),
		0.995
	),
	0.5,
	0.05
)
