FreqShift(
	SinOsc(10, 0),
	LfNoise2(0.3) * 1500,
	SinOsc(500, 0).LinLin(-1, 1, 0, 2 * pi)
) * 0.1
