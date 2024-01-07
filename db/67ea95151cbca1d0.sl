(* MiBraids ; scanning ; requires=keywords *)
let pitch = MouseY(33, 72, 0, 0.2);
let timbre = LfNoise1(0.3) * 0.5 + 0.5;
let color = LfNoise1(0.3) * 0.5 + 0.5;
let model = MouseX(0, 47, 0, 0.2);
MiBraids(
	pitch: pitch,
	timbre: timbre,
	color: color,
	model: model,
	trig: 0,
	resamp: 1,
	decim: 0,
	bits: 0,
	ws: 0
) ! 2 * 0.1
