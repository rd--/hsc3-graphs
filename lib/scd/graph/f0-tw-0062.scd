// https://fredrikolofsson.com/f0blog/sapf-sctweets/ 0062
var b = (1 .. 9);
Splay.ar(
	SinOsc.ar(b * 55, 0).clip(
		SinOsc.ar(2 / b, 0) * 0.5,
		SinOsc.ar(3 / b, 0) * 0.5 + 1
	) * (
		SinOsc.ar(b * 55 + ( 4 / b), 0) * SinOsc.ar(1 / b, 0) * 6
	).tanh
) / 5
