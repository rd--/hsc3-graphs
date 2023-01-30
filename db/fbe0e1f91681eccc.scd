// https://twitter.com/redFrik/status/1562193233001623552 ; f0
var c = SinOscFB.ar(1 / 64, 0).round * 10 + 50;
var f = {
	arg i;
	var p = SinOscFB.ar(
		(i + 1 * c) + (SinOscFB.ar(2.02, 1) * 2),
		SinOscFB.ar(i + 1 / 24, 1) + 1 / 2
	) * SinOscFB.ar(i + 1 / 16, 1);
	var q = SinOscFB.ar(
		i + 1 * 50.05 ** SinOscFB.ar(6, 1),
		1
	) * SinOscFB.ar(i + 1 / 36, 1);
	p % q
};
var p = SinOscFB.ar((SinOscFB.ar(1.to(5), 1) * 3).round + 5 * c, 1) * SinOscFB.ar(12, 1).max(1) * 3;
var q = SinOscFB.ar(c, 0.7) * (SinOscFB.ar(3, 1).min(0) / 3);
0.to(11).collect(f).mean.tanh + Splay2.ar(p.tanh / 9) + q
