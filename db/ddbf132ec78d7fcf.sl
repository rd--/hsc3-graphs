var z = Decay2(
	Impulse(8, 0) * MulAdd(LfSaw(0.3, 0), -0.3, 0.3),
	0.001,
	0.3
) * Pulse([80, 81], 0.3).Sum;
Compander(
	in: z,
	control: z,
	thresh: MouseX(0.1, 1, 0, 0.2),
	slopeBelow: 1,
	slopeAbove: 0.1,
	clampTime: 0.01,
	relaxTime: 0.01
)
