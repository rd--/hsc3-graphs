let a = [
	SinOsc(440, 0),
	Saw(440),
	Pulse(440, 0.5)
];
let cycle = a.size * 0.5;
SelectX(LfSaw(1, 0) * cycle + cycle, a) * 0.2
