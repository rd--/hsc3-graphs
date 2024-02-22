let a = Dswitch1(
	MouseX(0, 4, 0, 0.2),
	0:4.collect { :i |
		Dseq(inf, [0 .. i * 3])
	}
);
let trig = Impulse(6, 0);
let freq = Demand(trig, 0, a) * 30 + 340;
SinOsc(freq, 0) * 0.1
