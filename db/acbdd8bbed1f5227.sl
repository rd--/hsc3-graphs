(* MiRings ; using the 'trig' input to excite the resonator ; requires=keywords *)
var trig = Dust(0.7);
var model = 1;
MiRings(in: 0,
	trig: trig,
	pit: 38,
	struct: 0.25,
	bright: 0.5,
	damp: 0.7,
	pos: 0.25,
	model: model,
	poly: 1,
	internExciter: 0,
	easterEgg: 0,
	bypass: 0
) * 0.2
