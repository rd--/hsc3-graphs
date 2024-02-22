{- MiRings ; inharmonic string ; requires=keywords -}
let trig = Dust(3);
let pit = Latch(WhiteNoise(), Dust(0.5)).LinLin(-1, 1, 30, 60);
let struct = Latch(PinkNoise(),	trig).LinLin(-1, 1, 0.1, 1);
let damp = 0.8;
let model = 2;
let poly = 4;
MiRings(in: 0,
	trig: trig,
	pit: pit,
	struct: struct,
	bright: 0.5,
	damp: damp,
	pos: 0.25,
	model: model,
	poly: poly,
	internExciter: 0,
	easterEgg: 0,
	bypass: 0
) * 0.25
