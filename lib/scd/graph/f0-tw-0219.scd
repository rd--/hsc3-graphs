// https://fredrikolofsson.com/f0blog/sapf-sctweets/ ; 0219 (456384156159574016)
var b = 1 / [3, 12, 4, 1, 6, 2];
Splay.ar(
	SinOsc.ar(
		HPF.ar(
			Ringz.ar(
				SinOsc.ar(b).lag3(
					SinOsc.ar(2.67 ** b, 0).abs
				) * 99,
				SinOsc.ar(1 / b / 9, b) > 0 * 20 + 99 / b,
				1
			),
			440
		)
	)
)
