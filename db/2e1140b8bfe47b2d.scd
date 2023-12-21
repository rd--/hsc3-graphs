// Drone for the Evening ; https://github.com/lukiss/Losers-Union-SC-Research
var p = (1, 3 .. 64);
var f = { (LFDNoise1.ar(8) / 16 + 33).midicps };
var c = p ** (p / p.sum).atan * f * p;
Splay.ar(
	SinOsc.ar(
		c,
		SinOsc.ar(c * 3, 0) * SinOsc.ar((SinOsc.ar(p / c, 0) * 8 + 8) / c, 0) * pi
	) *	SinOsc.ar(p / c, 0),
	SinOsc.ar(1 / 3, 0) * SinOsc.ar(1 / 32, 0)
)
