{- Phase Modulation Washer ; https://github.com/lukiss/Losers-Union-SC-Research ; https://sonomu.club/@lukiss/111071167369230347 -}
let p = (1, 3 .. 64);
let n = 110;
let f = p / pi * p.degreesToRadians * n;
Splay(
	PmOsc(
		f,
		f * 2,
		SinOsc(f / n, 0) * SinOsc(n / f, 0) * 2,
		SinOsc(3 / p, 0) * pi
	) * SinOsc(1 / p, 0),
	SinOsc(SinOsc(0.1 / n, 0) * 8, 0) / SinOsc(1 / n, 0) / 2
) / 3
