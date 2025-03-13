// https://fredrikolofsson.com/f0blog/sapf-sctweets/ 0428
var b = (1 .. 9);
var g = 1 / b;
Splay.ar(
	7 ** SinOsc.ar(
		g / 99,
		0
	) / 9 * SinOsc.ar(
		999 * b.scramble / RLPF.ar(
			Latch.ar(
				round(
					WhiteNoise.ar(),
					0.5
				) + 2,
				BrownNoise.ar() + 1.4 > SinOsc.ar(
					b / 999,
					0
				)
			),
			9 ** SinOsc.ar(g
				* 9,
				0
			) * 999,
			SinOsc.ar(
				b / 77,
				0
			) / 2 + 0.6,
		),
		0
	) * RLPF.ar(
		Latch.ar(
			WhiteNoise.ar(),
			BrownNoise.ar() + 1.3 > SinOsc.ar(
				b / 99,
				0
			)
		),
		9 ** SinOsc.ar(
			g,
			0
		) * 999,
		SinOsc.ar(
			b / 88,
			0
		) / 2 + 0.6
	)
)
