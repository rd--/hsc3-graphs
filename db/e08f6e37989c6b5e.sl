let mod = SinOsc(Line(1, 10, 10), 0);
[
	SinOsc(mod * 400 + 500, 0),
	SinOsc(LinExp(mod, -1, 1, 100, 900), 0)
] * 0.1
