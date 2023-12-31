(* MiBraids ; some modulation ; requires=keywords *)
var mod = LfNoise1(0.5) * 0.5 + 0.5;
MiBraids(
	pitch: 40,
	timbre: mod,
	color: 0,
	model: 1,
	trig: 0,
	resamp: 0,
	decim: 0,
	bits: 0,
	ws: 0
) ! 2 * 0.05
