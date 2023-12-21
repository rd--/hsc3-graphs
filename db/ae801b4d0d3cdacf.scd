// Suspect jazz ; https://github.com/lukiss/Losers-Union-SC-Research
var x = HenonL.ar(1 + LFDNoise1.kr(3).exprange(0.01, 1) * 8, 1.4, 0.3, 0, 0).fold2(1);
var t = { | n | PulseDivider.ar(x, 8, 7 - n) } ! 8;
var d = 1.5 + x.exprange(0.01, 1);
var e = { | c | Env.perc(0.004, d, 1, c).ar(0, t) };
var c = [0, 3, 7, -2];
var f = Demand.ar(
	t,
	0,
	Drand(c, inf) + Dxrand(48 + ({ | o | o * 12 + c } ! 3).flat, inf)
).midicps;
var o = SinOsc.ar(
	(BrownNoise.ar() * 0.015 + 1) * f,
	(BrownNoise.ar() / 4 * SinOsc.ar([3.25, 0.5, 2] * f, 0) * e.(-28)).sum
) * e.(-6) * (SinOsc.ar(d + 2, 0) * 0.25 + 0.5);
Splay.ar(o, 1 / 4)
