/* https://sonomu.club/@lukiss/113199362402063463 ; Sep 26, 2024, 03:26 */
let t = {
	CuspL(LfdNoise1([1, 1]).Max(0) ^ 2 * 32, 1, 1.9, 0)
};
let r = { :x :y |
	TRand(x, y, t())
};
Sanitize(
	Splay(
		CompanderD(
			LeakDc(
				LorenzL(
					t() * SampleRate(),
					r(1, r(1, 11)),
					r(1, r(2, 30)),
					r(0.001 / 77, 1 / 17),
					0.05,
					0.1, 0, 0
				).SoftClip,
				0.995
			),
			1 / 2,
			1 / 2,
			1 / 2,
			0.005,
			0.1
		),
		t().first
	),
	0
)
