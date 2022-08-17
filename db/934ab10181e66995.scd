// filtered decorrelated noise ; jmcc
CombN.ar(
	Resonz.ar({ BrownNoise.ar }.dup(2) * 0.4, MouseX.kr(20, 12000, 1, 0.2), 0.2),
	1 / 80,
	1 / 80,
	0.3
)
