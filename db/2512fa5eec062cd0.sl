var a = Dswitch1(
	MouseX(0, 4, 0, 0.2),
	[1, 3, MouseY(1, 15, 0, 0.2), 2, Dwhite(inf, 0, 3)]
);
var trig = Impulse(3, 0);
var freq = Demand(trig, 0, a) * 30 + 340;
SinOsc(freq, 0) * 0.1
