// https://sonomu.club/@lukiss/111749211970689312 ; Jan 14, 2024
var p = (1, 5 .. 96);
var c = { | a b c |
	StandardL.ar(a / pi, 1, 0.5, 0).sin.linlin(-1, 1, b, c)
};
var t = 2 ** (c.value(5, 0, 4)).floor;
var d = Latch.ar((c.value(13, 1, 5)).floor / t, TDuty.ar(1 / t, 0, 1, 0, 0));
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
var e = Env.perc(d / t, d, 1, 0).ar(0, TDuty.ar(d, 0, 1, 0, 0));
var a = (e.lincurve(0, 1, 1, 0, c.value(3, 2, -8)) * p).log.sin ** c.value(13, 4, 36);
var b = (e > c.value(9, 0.003, 0.9)).lag3(0.003);
LPF.ar(
	Splay.ar(
		SinOsc.ar(
			d * 55 * l.value,
			SinOsc.ar(l.value, 0) * e * c.value(2pi, 0, 2pi)
		) * a * b,
		SinOsc.ar(2pi, 0) * e
	).sanitize,
	9E3
)
