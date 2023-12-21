/* EnvTrapezoid ; control rate ; randomised parameters */
var tr = Impulse.kr(4, 0);
var env = EnvTrapezoid.kr(
	tr,
	TRand.kr(0.02, 0.20, tr),
	TRand.kr(0.25, 0.75, tr),
	TRand.kr(0.1, 0.9, tr)
);
SinOsc.ar(440, 0) * env * 0.1
