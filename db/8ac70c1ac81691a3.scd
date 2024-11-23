// https://sonomu.club/@lukiss/113293650390466946 ; Oct 12, 2024, 08:05 PM
var p = (1, 5 .. 96);
var c = { |a b c|
	StandardL.ar(a / pi, 1, 0.5, 0).sin.range(b, c)
};
var t = 2 ** (c.value(5, 0, 4)).floor;
var d = Latch.ar(
	c.value(13, 1, 5).floor / t,
	TDuty.ar(1 / t, 0, 1, 0, 0)
);
var l = {
	TChoose.kr(
		TDuty.kr(c.value(pi, 1 / t, 5) * d, 0, 1, 0, 0),
		[
			p * p.degrad,
			p.difsqr(p.scramble),
			p * p.log2,
			p.midiratio
		]
	)
};
var e = Env.perc(d / t, d, 1 , 0).ar(0, TDuty.ar(d, 0, 1, 0, 0));
var m = (e.lincurve(0, 1, 1, 0, c.value(3, 2, -8)) * p).log.sin ** c.value(13, 4, 36);
LPF.ar(
	Splay.ar(
		SinOsc.ar(
			d * 55 * l,
			SinOsc.ar(l, 0) * e * c.value(2 * pi, 0 , 2 * pi),
		) * m * Lag3.ar(e > c.value(9, 0.003, 0.9), 0.003),
		SinOsc.ar(2 * pi) * e
	).sanitize,
	9E3
)
