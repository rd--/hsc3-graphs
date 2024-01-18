{- MiBraids ; trigger ; 28=plucked ; requires=keywords -}
let tr = Dust(0.6);
let pitch = TRand(45, 72, tr).RoundTo(1);
let timbre = 0.5;
let color = LfNoise1(0.3) * 0.5 + 0.5;
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
