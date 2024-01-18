// zizle (jmcc) #SC3d1.5
{
	var a = {
		arg f;
		Mix.ar(SinOsc.ar(f * [Rand.ir(0.7, 1.3), 1], { 2 * Rand.ir(0, pi) }.dup(2), 0.1))
	};
	var a1 = a.value(ExpRand.ir(0.3, 0.8)).max(0);
	var a2 = a.value(ExpRand.ir(6, 24)).abs;
	Pan2.ar(SinOsc.ar(Rand.ir(24, 108).midicps, 2 * Rand.ir(0, pi)) * a1 * a2, Rand.ir(-1, 1), 1)
}.overlap(4, 4, 12)

// zizle (jmcc) #SC3d1.5 ; language random
Texture.overlapRoutine({
	var a = {
		arg f;
		Mix.ar(SinOsc.ar(f * [0.7.rrand(1.3), 1], [2 * pi.rand, 2 * pi.rand], 0.1))
	};
	var a1 = a.value(0.3.exprand(0.8)).max(0);
	var a2 = a.value(6.exprand(24)).abs;
	Pan2.ar(SinOsc.ar(24.rrand(108).midicps, 2 * pi.rand) * a1 * a2, 1.0.rand2, 1)
}, 4, 4, 12)
