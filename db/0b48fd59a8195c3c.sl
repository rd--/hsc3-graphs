{
	var seq = Drand(inf, [1, 2, 3, 7, 8]);
	var trig = Impulse(MouseX(1, 60, 1, 0.2), 0);
	var freq = Demand(trig, 0, seq) * 30 + 340;
	SinOsc(freq, 0) * 0.1
} ! 2
