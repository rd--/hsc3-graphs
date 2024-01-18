{- What was I thinking? ; Jmcc -}
let z = Rlpf(
	Pulse(
		MulAdd(SinOsc(4, 0), 1, 80).Max(
			Decay(LfPulse(0.1, 0, 0.05) * Impulse(8, 0) * 500, 2)
		),
		MulAdd(LfNoise1(0.157), 0.4, 0.5)
	) * 0.04,
	MulAdd(LfNoise1(0.2), 2000, 2400),
	0.2
);
let y = z * 0.6;
z + [
	CombL(y, 0.06, MulAdd(LfNoise1(0.3.Rand0), 0.025, 0.035), 1) +
	CombL(y, 0.06, MulAdd(LfNoise1(0.3.Rand0), 0.025, 0.035), 1)
	,
	CombL(y, 0.06, MulAdd(LfNoise1(0.3.Rand0), 0.025, 0.035), 1) +
	CombL(y, 0.06, MulAdd(LfNoise1(0.3.Rand0), 0.025, 0.035), 1)
]
