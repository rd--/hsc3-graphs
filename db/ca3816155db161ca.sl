(* Phase Modulation Washer ; https://github.com/lukiss/Losers-Union-SC-Research *)
var p = (1, 3 .. 64);
var n = 110;
var f = p / pi * p.degreesToRadians * n;
Splay(
	PmOsc(
		f,
		f * 2,
		SinOsc(f / n, 0) * SinOsc(n / f, 0) * 2,
		SinOsc(3 / p, 0) * pi
	) * SinOsc(1 / p, 0),
	SinOsc(SinOsc(0.1 / n, 0) * 8, 0) / SinOsc(1 / n, 0) / 2
) / 3
