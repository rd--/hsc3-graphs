let a = [
	SinOsc(440, 0),
	Saw(440),
	Pulse(440, 0.5)
];
TChoose(Dust(MouseX(1, 1000, 1, 0.2)), a) * 0.2
