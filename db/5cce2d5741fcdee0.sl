var tr = Impulse(4, 0);
var env = EnvTrapezoid(
	tr,
	TRand(0.02, 0.20, tr),
	TRand(0.25, 0.75, tr),
	TRand(0.1, 0.9, tr)
);
SinOsc(440, 0) * env * 0.1
