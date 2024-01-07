let left = Mul(
	Decay2(Impulse(0.6, 0) * 0.25, 0.01, 0.25),
	SinOsc(SinOsc(3.7, 0) * 200 + 500, 0)
);
let right = Mul(
	Decay2(Impulse(0.5, 0) * 0.25, 0.01, 0.25),
	Resonz(PinkNoise() * 4, SinOsc(2.7, 0) * 1000 + 2500, 0.2)
);
PingPongDelay(left, right, 0.5, MouseX(0.1, 0.5, 0, 0.2), 0.7)
