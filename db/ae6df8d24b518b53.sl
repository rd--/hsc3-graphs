var tr = LfPulse(6, 0, 0.5);
var freq = {
	DemandSequencer(Drand(inf, [1 2 3 7 8]), tr) * 30 + 340
} ! 2;
SinOsc(freq, 0) * 0.1
