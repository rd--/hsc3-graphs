{- http://twitter.com/lukiss163/status/1619072788311973896 ; Lnu -}
let c = 0:8.collect { :n |
	let d = Dust(1);
	TRand(0.5, 2.5, d).Lag3(1 / 16) ^ n
};
let m = c.last;
let n = c / c.Sum;
let o = SinOsc(c.Log10 * c, 0);
let r = TChoose(
	Dust(1 + m),
	[c.Sum, n, c.RoundTo(32), n.Atan2(m), c.Sin, c.Tan, n.Hypot(c)]
);
let e = ((LfSaw(c.Tan / m, 0).Abs ^ r.Max(0)).Log10.Sin.Abs ^ 10).Tanh;
Splay(
	o * e,
	SinOsc(m * m, 0)
)
