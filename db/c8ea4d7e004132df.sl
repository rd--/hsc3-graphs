(* 27 Jan 2023 ; https://github.com/lukiss/Losers-Union-SC-Research *)
var d = Dust(1);
var m = {
	TRand(0.5, 2.5, d).Lag3(1 / 16)
};
var c = (0 .. 9).collect { :n |
	m() ^ n
};
var n = c / c.Sum;
var e = TChoose(
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
var a = ((LfSaw(c.Tan / m(), 0).Abs ^ e.Max(0)).Log10.Sin.Abs ^ 10).Tanh;
Splay(
	SinOsc(c.Log10 * c, 0) * a,
	SinOsc(m() * m(), 0) * 0.5
) / 23
