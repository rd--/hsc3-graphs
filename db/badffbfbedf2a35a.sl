(* What was I thinking? ; Jmcc *)
let z = Rlpf(
	Pulse(
		Max(SinOsc(4, 0) + 80,
			Decay(LfPulse(0.1, 0, 0.05) * Impulse(8, 500), 2)
		),
		LfNoise1(0.157).MulAdd(0.4, 0.5)) * 0.04,
	LfNoise1(0.2).MulAdd(2000, 2400),
	0.2);
let y = z * 0.6;
z +  [
	CombL(y, 0.06, LfNoise1(0.3.Rand0).MulAdd(0.025, 0.035), 1)
	+ CombL(y, 0.06, LfNoise1(0.3.Rand0).MulAdd(0.025, 0.035), 1)
	,
	CombL(y, 0.06, LfNoise1(0.3.Rand0).MulAdd(0.025, 0.035), 1)
	+ CombL(y, 0.06, LfNoise1(0.3.Rand0).MulAdd(0.025, 0.035), 1)
]
