// Phase Modulation Washer ; https://github.com/lukiss/Losers-Union-SC-Research
var p = (1, 3 .. 64);
var n = 110;
var f = p / pi * p.degrad * n;
Splay.ar(
	PMOsc.ar(
		f,
		f * 2,
		SinOsc.ar(f / n, 0) * SinOsc.ar(n / f, 0) * 2,
		SinOsc.ar(3 / p, 0) * pi
	) * SinOsc.ar(1 / p, 0),
	SinOsc.ar(SinOsc.ar(0.1 / n, 0) * 8, 0) / SinOsc.ar(1 / n, 0) / 2
)
