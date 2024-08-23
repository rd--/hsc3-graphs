// https://sonomu.club/@lukiss/113007186778241483
var k = 0.13;
var l = { |a b|
	k = k + k;
	LatoocarfianN.ar(k, 1, 3, k, 0.5, 0.5, 0.5).tanh.linlin(-1, 1, a, b)
};
var d = {
	Decay2.ar(
		TDuty.ar(1 / 8, 0, 1, 0, 0),
		l.value(0.01, 1 / 9),
		l.value(0.1, 1)
	)
};
Normalizer.ar(
	LeakDC.ar(
		MoogFF.ar(
			LorenzL.ar(
				20000,
				l.value(21, 4),
				l.value(6, 17),
				l.value(0.003, 1 / 5),
				d.value.clip(0, 0.05),
				0.1,
				0,
				0
			) ! 2,
			l.value(9, d * l.value(9, 20000)) + 999, /* ! */
			2 + d.value,
			0
		),
		0.995
	),
	0.5,
	0.05
)
