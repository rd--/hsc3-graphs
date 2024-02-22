{- 27 Jan 2023 ; https://github.com/lukiss/Losers-Union-SC-Research -}
let d = Dust(1);
let m = {
	TRand(0.5, 2.5, d).Lag3(1 / 16)
};
let c = 0:9.collect { :n |
	m() ^ n
};
let n = c / c.Sum;
let e = TChoose(
	Dust(1 + m()),
	[
		c.Sum,
		n,
		c.RoundTo(32),
		n.Atan2(m()),
		c.Sin,
		c.Tan,
		n.Hypot(c)
	]
);
let a = ((LfSaw(c.Tan / m(), 0).Abs ^ e.Max(0)).Log10.Sin.Abs ^ 10).Tanh;
Splay(
	SinOsc(c.Log10 * c, 0) * a,
	SinOsc(m() * m(), 0) * 0.5
) / 23
