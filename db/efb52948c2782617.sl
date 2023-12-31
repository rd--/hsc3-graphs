(* MiRings ; sympathetic strings ; requires=keywords *)
var trig = Dust(1);
var pit = Latch(WhiteNoise(), trig).Range(30, 60).RoundTo(1);
var struct = LfNoise2(0.4).Range(0, 1);
var model = 1;
var poly = 4;
MiRings(in: 0,
	trig: 0,
	pit: pit,
	struct: struct,
	bright: 0.5,
	damp: 0.7,
	pos: 0.25,
	model: model,
	poly: poly,
	internExciter: 0,
	easterEgg: 0,
	bypass: 0
) * 0.5
