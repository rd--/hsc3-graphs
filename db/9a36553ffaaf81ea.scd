/* EnvTrapezoid ; audio rate ; randomised parameters */
var tr = Impulse.ar(1, 0);
var env = {
	EnvTrapezoid.ar(
		tr,
		TRand.ar(0.02, 0.90, tr),
		TRand.ar(0.15, 0.85, tr),
		TRand.ar(0.10, 0.90, tr)
	);
} ! 2;
SinOsc.ar([333, 444], 0) * env * 0.1
