// https://fredrikolofsson.com/f0blog/sapf-sctweets/ 0327
SinOsc.ar(
	0,
	SinOsc.ar(
		99,
		9 ** SinOsc.ar(
			1 / 8,
			lagud(
				SinOsc.ar(1 / [2, 12], 0) < 0 * 2 ** SinOsc.ar(SinOsc.ar(3, 0) > 0 * 150, 0),
				1 / 50,
				1 / 5
			) * 5
		)
	) + SinOsc.ar(1 / [6, 7]), 3
).tanh
