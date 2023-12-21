/* EnvTrapezoid ; audio rate ; randomised parameters */
var tr = Impulse.ar(4, 0);
var env = EnvTrapezoid.ar(
	tr,
	TRand.ar(0.02, 0.20, tr),
	TRand.ar(0.25, 0.75, tr),
	TRand.ar(0.1, 0.9, tr)
);
SinOsc.ar(440, 0) * env * 0.1
