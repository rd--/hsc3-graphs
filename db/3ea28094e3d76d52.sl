var gatedNoise = Gate(
	LfNoise2(4),
	LfPulse(4 / 3, 0, 1 / 4)
);
SinOsc(gatedNoise * 100 + 200, 0) * 0.1
