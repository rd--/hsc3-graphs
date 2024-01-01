var freq = (0 .. 9).collect { :i |
	LfNoise2(Rand(10, 20)) * 200 + (i + 3 * 100)
};
Splay2(
	SinOsc(freq, 0),
	MouseY(1, 0, 0, 0.2),
	0.1,
	MouseX(-1, 1, 0, 0.2),
	true
)
