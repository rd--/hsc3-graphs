// https://fredrikolofsson.com/f0blog/sapf-sctweets/ 0183
(
	{ |i|
		Splay.ar(
			{ |j|
				var a = i * 2 + j / 12;
				CombC.ar(
					SinOsc.ar(j + 1 * 99, 0),
					1,
					SinOsc.ar(a, 0) / 2 + 0.5,
					1
				) * SinOsc.ar(
					i + j * 99 + 99,
					0
				) * SinOsc.ar(a / 3, 0)
			} ! 8
		)
	} ! 8
).mean.tanh
