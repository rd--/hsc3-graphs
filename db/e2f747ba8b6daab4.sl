(* Drone for the Evening ; https://github.com/lukiss/Losers-Union-SC-Research *)
var p = (1, 3 .. 64);
var f = (LfdNoise1(8) / 16 + 33).MidiCps;
var c = p ^ (p / p.sum).ArcTan * f * p;
Splay(
	SinOsc(
		c,
		SinOsc(c * 3, 0) * SinOsc((SinOsc(p / c, 0) * 8 + 8) / c, 0) * pi
	) * SinOsc(p / c, 0),
	SinOsc(1 / 3, 0) * SinOsc(1 / 32, 0)
) / 3
