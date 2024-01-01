var p = Impulse(8, 0);
var p4 = PulseDivider(p, 4, 0);
[
	SinOsc(1200, 0) * Decay2(p, 0.005, 0.1),
	SinOsc(600, 0) * Decay2(p4, 0.005, 0.5)
] * 0.4
