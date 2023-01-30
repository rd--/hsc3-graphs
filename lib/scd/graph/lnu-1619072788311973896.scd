// https://twitter.com/lukiss163/status/1619072788311973896 ; lnu
var c = (0 .. 8).collect { arg n;
	var d = Dust.kr(1);
	TRand.kr(0.5, 2.5, d).lag3(1 / 16) ** n
};
var m = c.last;
var n = c / c.sum;
var o = SinOsc.ar(c.log10 * c, 0);
var r = TChoose.kr(Dust.kr(1 + m), [c.sum, n, c.round(32), n.atan2(m), c.sin, c.tan, n.hypot(c)]);
var e = ((LFSaw.ar(c.tan / m, 0).abs ** r.max(0)).log10.sin.abs ** 10).tanh;
Splay.ar(
	o * e,
	SinOsc.ar(m * m, 0),
	1,
	0,
	true
)
