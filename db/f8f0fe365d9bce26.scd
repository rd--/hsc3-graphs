/* EnvTrapezoid ; control rate ; randomised parameters */
var tr = Impulse.kr(1, 0);
var env = {
	EnvTrapezoid.kr(
		tr,
		TRand.kr(0.02, 0.90, tr),
		TRand.kr(0.15, 0.85, tr),
		TRand.kr(0.10, 0.90, tr)
	);
} ! 2;
SinOsc.ar([333, 444], 0) * env * 0.1
