// Phasing Patterns ; https://github.com/lukiss/Losers-Union-SC-Research
var f = (48 + ({ | n | [0, -5, 15, 10] + (n * 12)} ! 3).flat).midicps;
Splay.ar(
	SinOsc.ar(
		f,
		SinOsc.ar(f * 2, 0) * (SinOsc.ar(1 / f.acosh / (SinOsc.ar(1 / f, 0) * f), 0) * 8 + 8)
	) * (SinOsc.ar(1.2 ** f.normalizeSum, 0) ** 1.5 * SinOsc.ar(f.atan, 0)),
	SinOsc.ar(1 / 8, 0)
)
