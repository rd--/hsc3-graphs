// https://sonomu.club/@lukiss/111534001937293189
var t = TDuty.kr(1 / (2 ** Diwhite(0, 8, inf)), 0, 1, 0, 0);
var l = {
	var z = nil;
	TChoose.kr(
		t,
		(0 .. 7).collect { | n |
			z = ((LFDNoise1.kr(4) + 2 ** n) / 16);
			SinOsc.kr(z, 0).sin
		}
	).lag(0.25 / z)
};
var p = (1 .. 32);
var e = LFSaw.ar(l.value * p.midiratio, 1) * 0.5 + 0.5 ** 8;
Splay.ar(
	LeakDC.ar(
		Blip.ar(
			p * p.midiratio * TChoose.kr(t, 2 * p.midicps),
			LFSaw.kr(l.value, 1).lincurve(-1, 1, 1, LFSaw.kr(l.value * p.degrad, 1) * 200 + 201, 8)
		) * e,
		0.995
	) * 0.25,
	l.value
)
