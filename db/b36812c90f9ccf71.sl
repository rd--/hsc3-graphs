(* MiBraids ; trigger ; 28=plucked ; requires=keywords *)
var tr = Dust(0.6);
var pitch = TRand(45, 72, tr).RoundTo(1);
var timbre = 0.5;
var color = LfNoise1(0.3) * 0.5 + 0.5;
MiBraids(
	pitch: pitch,
	timbre: timbre,
	color: color,
	model: 28,
	trig: tr,
	resamp: 0,
	decim: 0,
	bits: 0,
	ws: 0
) ! 2 * 0.1
