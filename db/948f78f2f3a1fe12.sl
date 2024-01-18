{- MiRings ; using the 'pit' input to set midi pitch and excite the resonator ; requires=keywords -}
let pit = LfNoise0(2).Range(30,	50);
let model = 2;
MiRings(in: 0,
	trig: 0,
	pit: pit,
	struct: 0.25,
	bright: 0.5,
	damp: 0.7,
	pos: 0.25,
	model: model,
	poly: 1,
	internExciter: 0,
	easterEgg: 0,
	bypass: 0
) * 0.5
