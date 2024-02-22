// https://scsynth.org/t/5296 ; tm881
{
	var f = { Rand(33, 2000) }.dup(2) * TRand.kr(0.125, 4, Impulse.kr(1 / 10, 0));
	var t = Impulse.kr(1 / 2 * TRand.kr(0.125, 4, Impulse.kr(1 / 5, 0)), 0);
	var a = EnvGen.kr(Env.perc(0.01, 1, 1, -4), t);
	FreeVerb.ar(Saw.ar(f) * a)
}.dup(32).sum / 24
