(* MiBraids ; paraphonic ; requires=keywords *)
let timbre = LfNoise1(0.03) * 0.5 + 0.5;
let color = LfNoise1(0.05) * 0.5 + 0.5; (* chord *)
MiBraids(
	pitch: 38,
	timbre: timbre,
	color: color,
	model: 40,
	trig: 0,
	resamp: 1,
	decim: 0,
	bits: 0,
	ws: 0
) ! 2 * 0.1
