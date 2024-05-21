{- Drone for the Evening ; https://github.com/lukiss/Losers-Union-SC-Research ; https://sonomu.club/@lukiss/111024677229943163 -}
let p = (1, 3 .. 64);
let f = (LfdNoise1(8) / 16 + 33).MidiCps;
let c = p ^ (p / p.sum).ArcTan * f * p;
Splay(
	SinOsc(
		c,
		SinOsc(c * 3, 0) * SinOsc((SinOsc(p / c, 0) * 8 + 8) / c, 0) * pi
	) * SinOsc(p / c, 0),
	SinOsc(1 / 3, 0) * SinOsc(1 / 32, 0)
) / 3
