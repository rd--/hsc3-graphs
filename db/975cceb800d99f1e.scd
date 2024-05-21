// https://sonomu.club/@lukiss/111518889311136686 ; Dec 04, 2023
var t = TDuty.kr(1 / (2 ** Diwhite(0, 6, inf)), 0, 1, 0, 0);
var r = { | lo hi |
	TRand.kr(lo, hi, t)
};
var l = {
	var z = nil;
	TChoose.kr(
		t,
		(0 .. 3).collect { | n |
			z = (LFNoise2.kr(4) * 2 + 3 ** n) / 4;
			SinOsc.ar(z, 0).sin
		}
	).lag(1 / 8 / z)
};
var e = LFSaw.kr(l.value * r.value(1, 8), 1) + 1 / 2;
var f = r.value(24,48).ceil.midicps;
var p = (1 .. 32);
var q = SinOsc.ar(
	f * p * p.midiratio,
	SinOsc.ar(p.midiratio ** 2, 0) * (l.value * 2 - e * 2 * pi)
) * ((e * p.midiratio).log.sin.abs ** r.value(4, 128));
var a = Splay.ar(q.scramble, SinOsc.ar(r.value(0.5,8), 0));
var h = SinOsc.ar(
	SinOsc.ar([6, 7], 0) * (1 / 6) + 2 * f,
	0
) * (1 - e ** 8) * r.value(1, 32);
var b = SinOsc.ar(f, h) * (1.1 - e ** 2) * 0.5;
(a + b).sanitize
