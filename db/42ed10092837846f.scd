// https://sccode.org/1-4Qy ; f0 ; 0296
var f = (0 .. 7).collect { | i |
	var p = SinOscFB.ar(2 ** (1 / 8) ** i, i / 8) * SinOscFB.ar(i + 8 / 8, 0);
	var q = SinOscFB.ar(i + [2, 3] / 88, 0);
	p > q
}.sum * 88;
HPF.ar(CombN.ar(SinOscFB.ar(f, SinOscFB.ar(1 / 18, 1)), 0.2, 0.2, 1), 8) / 3
