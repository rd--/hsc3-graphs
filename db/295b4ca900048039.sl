let z = Decay2(
	Impulse(8, 0) * (LfSaw(0.25, 0) * -0.6 + 0.7),
	0.001,
	0.3
) * FSinOsc(500, 0);
[z, Normalizer(z, 0.4, 0.01)] * 0.2
