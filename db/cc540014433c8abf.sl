{- http://twitter.com/redFrik/status/1562193233001623552 ; F0 -}
let c = SinOscFb(1 / 64, 0).RoundTo(1) * 10 + 50;
let o = SinOscFb((SinOscFb([1 .. 5], 1) * 3).RoundTo(1) + 5 * c, 1);
let p = o * SinOscFb(12, 1).Max(1) * 3;
let q = SinOscFb(c, 0.7) * (SinOscFb(3, 1).Min(0) / 3);
0:11.collect { :i |
	let p = SinOscFb(
		(i + 1 * c) + (SinOscFb(2.02, 1) * 2),
		SinOscFb(i + 1 / 24, 1) + 1 / 2
	) * SinOscFb(i + 1 / 16, 1);
	let q = SinOscFb(
		i + 1 * 50.05 ^ SinOscFb(6, 1),
		1
	) * SinOscFb(i + 1 / 36, 1);
	p % q
}.mean.Tanh + Splay2(p.Tanh / 9) + q
