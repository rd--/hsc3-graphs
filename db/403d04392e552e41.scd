// https://sonomu.club/@lukiss/113301936019342699 ; Oct 14, 2024, 07:12 AM
var d = 4 ** (0 .. 4);
var o = VarSaw.ar(
	d * 55,
	1,
	CuspN.ar(d.atan / 8, 1, 1.9, 0) + 1 / 2
);
Splay.ar(
	Compander.ar(
		DelayC.ar(
			o * Env.perc(
				0,
				1 / (VarSaw.ar(1 / d, 0, 0.5) + 1 * d + d),
				1,
				-4
			).ar(
				0,
				CuspN.ar(8, 1, 1.9, 1 / d),
				1,
				1,
				0
			) + (CuspN.ar(22050, 1, 1.9, 0) * 2E-4),
			1,
			0.005
		),
		o.rotate(1),
		1 / 2,
		1 / 2,
		1 / 4,
		0.004,
		1 / 6
	).sin / 2,
	CuspN.ar(8, 1, 1.9, 0)
)
