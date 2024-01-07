let x = 10;
let y = LfSaw(1 / [6, 11], [0, 1]) * 100;
let distance = Hypot(x, y);
let amplitude = 40 / distance.Squared;
let motorSound = Rlpf(
	SinOsc(200, 0) * LfPulse([31.3, 23.1], 0, 0.4),
	400,
	0.3
);
DelayL(motorSound, 110 / 344, distance / 344) * amplitude
