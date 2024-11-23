// https://sonomu.club/@lukiss/113199362402063463 ; Sep 26, 2024, 03:26
var t = {
	CuspL.ar(LFDNoise1.ar(1 ! 2).max(0) ** 2 * 32, 1, 1.9, 0)
};
var r = { |x y|
	TRand.kr(x, y, t.value)
};
Sanitize.ar(
	Splay.ar(
		CompanderD.ar(
			LeakDC.ar(
				LorenzL.ar(
					t.value * SampleRate.ir(),
					r.value(1, r.value(1, 11)),
					r.value(1, r.value(2, 30)),
					r.value(0.001 / 77, 1 / 17),
					0.05,
					0.1, 0, 0
				).softclip,
				0.995
			),
			1 / 2,
			1 / 2,
			1 / 2,
			0.005,
			0.1
		),
		t.value()[0]
	),
	0
)
