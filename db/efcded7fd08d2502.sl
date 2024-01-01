Decay2(
	Impulse(8, 0) * MulAdd(LfSaw(0.3, 0), -0.3, 0.3),
	0.001,
	0.3
) * Pulse([80, 81], 0.3).Sum
