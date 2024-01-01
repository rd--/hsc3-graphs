FreeVerb(
	Decay(
		Impulse([1, 1/3], 0),
		0.25
	) * LfCub([1200, 700], 0) * 0.1,
	MouseX(0, 1, 0, 0.2),
	MouseY(0, 1, 0, 0.2),
	LfNoise2(0.1).Range(0, 1)
)
