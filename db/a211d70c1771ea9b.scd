// 27 Jan 2023 ; https://github.com/lukiss/Losers-Union-SC-Research
var d = Dust.kr(1);
var m = {
	TRand.kr(0.5, 2.5, d).lag3(1 / 16)
};
var c = (0 .. 9).collect { | n |
	m.() ** n
};
var n = c / c.sum;
var e = TChoose.kr(
	Dust.kr(1 + m.()),
	[
		c.sum,
		n,
		c.round(32),
		n.atan2(m.()),
		c.sin,
		c.tan,
		n.hypot(c)
	]
);
var a = ((LFSaw.ar(c.tan / m.(), 0).abs ** e.max(0)).log10.sin.abs ** 10).tanh;
Splay.ar(
	SinOsc.ar(c.log10 * c, 0) * a,
	SinOsc.ar(m.() * m.(), 0) * 0.5
)
