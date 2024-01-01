var z = Decay2(
	Impulse(8, 0) * MulAdd(LfSaw(0.3, 0), -0.3, 0.3),
	0.001,
	0.3
) * Pulse([80, 81], 0.3).Sum;
Compander(
	in: z,
	control: z,
	thresh: MouseX(0.01, 0.15, 0, 0.2),
	slopeBelow: 1 / 3,
	slopeAbove: 1,
	clampTime: 0.01,
	relaxTime: 0.05
) * 0.5
