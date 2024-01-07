(* Analog bubbles (Jmcc) #1 ; applicative order *)
Mul(
	CombN(
		MulAdd(
			SinOsc(
				MulAdd(
					LfSaw(0.4, 0),
					24,
					MulAdd(
						LfSaw([8, 7.23], 0),
						3,
						80
					)
				).MidiCps,
				0),
			0.05,
			0),
		0.2,
		0.2,
		4
	),
	0.1
)
