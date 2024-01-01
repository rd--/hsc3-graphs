var gatedNoise = Gate(
	LfNoise2(4),
	LfPulse(1.333, 0, 0.25)
);
SinOsc(gatedNoise * 100 + 200, 0) * 0.1
