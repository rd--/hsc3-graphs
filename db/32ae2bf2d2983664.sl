MidEq(
	Saw(200) * 0.1,
	SinOsc(LfNoise2(1 / 3), 0).MulAdd(24, 84).MidiCps,
	0.3,
	12
)
