(* MiRings ; inharmonic string ; requires=keywords *)
var trig = Dust(3);
var pit = Latch(WhiteNoise(), Dust(0.5)).Range(30, 60);
var struct = Latch(PinkNoise(),	trig).Range(0.1, 1);
var damp = 0.8;
var model = 2;
var poly = 4;
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
