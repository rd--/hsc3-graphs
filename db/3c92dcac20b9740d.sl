(* MiBraids ; 34=kick ; requires=keywords *)
var trig = Impulse(4, 0);
var pitch = LinLin(Latch(PinkNoise(), trig), -1, 1, 30, 50).RoundTo(1);
var timbre = LfNoise1(0.4) * 0.5 + 0.5;
var color = LfNoise1(0.3) * 0.5 + 0.5;
MiBraids(
	pitch: pitch,
	timbre: timbre,
	color: color,
	model: 34,
	trig: trig,
	resamp: 0,
	decim: 0,
	bits: 0,
	ws: 0
) ! 2 * 0.2
