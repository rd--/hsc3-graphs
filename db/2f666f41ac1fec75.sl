var x = 10;
var y = LfSaw(1 / [6, 11], [0, 1]) * 100;
var distance = Hypot(x, y);
var amplitude = 40 / distance.Squared;
var motorSound = Rlpf(
	SinOsc(200, 0) * LfPulse([31.3, 23.1], 0, 0.4),
	400,
	0.3
);
DelayL(motorSound, 110 / 344, distance / 344) * amplitude
