var array = [
	SinOsc(111, 0),
	Saw(333),
	Pulse(555, 0.5)
] / [9, 17, 23];
var weights = [0.7 0.2 0.1];
TwChoose(
	Dust(MouseX(1, 1000, 1, 0.2)),
	array,
	weights,
	0
)
