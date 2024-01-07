(* MiRings ; simple vibrato ; requires=keywords *)
let trig = Dust(0.5);
let pit = Latch(WhiteNoise(), trig).Range(36, 48) + SinOsc(3, 0);
MiRings(in: 0,
	trig: 0,
	pit: pit,
	struct: 0.2,
	bright: 0.5,
	damp: 0.7,
	pos: 0.25,
	model: 0,
	poly: 1,
	internExciter: 0,
	easterEgg: 0,
	bypass: 0
)
