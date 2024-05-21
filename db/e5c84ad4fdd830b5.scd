// https://sonomu.club/@lukiss/111422385501420073
var x = CuspL.ar(CuspL.ar(3, 1, 1.9, 0).exp * 12 + 1, 1, 1.9, 0).fold2(1);
var t = (0 .. 7).collect { | n | PulseDivider.ar(x, 8, 7 - n) };
var d = x.linlin(-1, 1, 1 / 2, 2);
var e = { | c |
	Env.perc(0.001, d, 1, c).ar(0, t)
};
var c = [0, 3, 7, -2];
var f = Demand.ar(
	t,
	0,
	Dseq(c, inf) + Dxrand(48 + (0 .. 2).collect { | o | o * 12 + c }.flat, inf)
).midicps;
Splay.ar(
	SinOsc.ar(
		BrownNoise.ar() * 0.0125 + 1 * f,
		(BrownNoise.ar() * 0.4 * (SinOsc.ar([3.25, 1 / 2, 2] * f, 0) * e.value(-58))).sum
	) * e.value(-6) * (SinOsc.ar(d + 2, 0) / 4 + 0.5),
	1/4
)
