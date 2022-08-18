// wind metals (jmcc)
{
	var n = 6;
	var env = LFNoise1.kr(ExpRand.ir(0.125, 0.5), 0.75, 0.25).max(0);
	var exc = { BrownNoise.ar }.dup(2) * 0.007 * env;
	var freq = { Rand.ir(0, Rand.ir(500, 8000)) + ExpRand.ir(60, 4000) }.dup(n);
	var time = { Rand.ir(0.1, 2.0) }.dup(n);
	var s = RingzBank.ar(exc, freq, nil, time);
	(s * 0.1).softClip
}.overlap(5, 2, 12)
