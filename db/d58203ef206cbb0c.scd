// Mistakes were made ; https://github.com/lukiss/Losers-Union-SC-Research
var p = 9 / 7 ** (0 .. 16);
var c = { | freq | LinCongC.ar(freq, 1.1, 0.13, 1, 0) };
var d = (c.(c.(p.atan) ** 2 * 4) ** 4 * 8).abs;
var t = c.(c.(d / p.atan).round(1 / d) ** 4 * d * 8).sin;
var f = TRand.ar(0, 64, t).ceil.midicps;
Splay.ar(
	LeakDC.ar(
		Pluck.ar(
			(SinOsc.ar(
				f * p * p.log,
				0
			) *	SinOsc.ar(f * p * p.log / 2, 0) * 2 * d).sin,
			t,
			0.1,
			t.exprange(0.01, 1) / d / p,
			(t ** 1.5 * f) * (d / p.scramble),
			(p * (1 - t.exprange(0.01, 1))).sin.exprange(0.9999,0.5)
		),
		0.995
	),
	SinOsc.ar(f / d[0], 0)
).tanh * 0.8
