(* police state ; jmcc *)
let n = 4; (* number of sirens *)
CombL(
	{
		EqPan(
			SinOsc(
				MulAdd(
					SinOsc(Rand(0, 0.1) + 0.02, 2 * Rand(0, pi)),
					Rand(0, 600),
					1000 + Rand(-300, 300)
				),
				0
			),
			Rand(-1, 1)
		) * LfNoise2(100 + Rand(-20, 20)) * 0.1
	} !+ 4 + Mul(
		LfNoise2(MulAdd(LfNoise2([0.4, 0.4]), 90, 620)),
		MulAdd(LfNoise2([0.3, 0.3]), 0.15, 0.18)
	),
	0.3, 0.3, 3
) * 0.5
