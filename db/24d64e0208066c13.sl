let p = Impulse(8, 0);
let p2 = PulseDivider(p, 2, 1);
let p4 = PulseDivider(p, 4, 0);
let p16 = PulseDivider(p, 16, 0);
[
	SinOsc(1200, 0) * Decay2(p, 0.005, 0.1),
	SinOsc(800, 0) * Decay2(p2, 0.005, 0.5),
	SinOsc(600, 0) * Decay2(p4, 0.005, 0.5),
	SinOsc(200, 0) * Decay2(p16, 0.005, 1.0)
].Splay * 0.3
