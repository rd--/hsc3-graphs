var sf = SfAcquireMono('floating_1');
var pointer = Phasor(
	0,
	SampleDur() / SfDur(sf) * XLine(1, 0.25, 20),
	0,
	1,
	0
);
var sound = Warp1(
	1,
	sf,
	pointer,
	1,
	0.3,
	-1,
	16,
	Line(0, 1, 40),
	4
);
EqPan(sound, pointer * 2 - 1) / 4
