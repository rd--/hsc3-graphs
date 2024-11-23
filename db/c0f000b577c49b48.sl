/* MiBraids ; vosim ; requires=keywords */
let pitch = LinLin(LfNoise0(4), -1, 1, 33, 66).RoundTo(1);
let timbre = LfNoise1(0.3) * 0.5 + 0.5;
let color = LfNoise1(0.3) * 0.5 + 0.5;
MiBraids(
	pitch: pitch,
	timbre: timbre,
	color: color,
	model: 21,
	trig: 0,
	resamp: 0,
	decim: 0,
	bits: 0,
	ws: 0
) # 2 * 0.1
