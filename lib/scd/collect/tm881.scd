// https://scsynth.org/t/5296 ; tm881
{ Saw.ar({ Rand.ir(33, 2000) }.dup(2) * XLine.kr(Rand.ir(0.125, 8), Rand.ir(0.125, 8), 60)) }.dup(99).sum / 99

// https://scsynth.org/t/5296 ; tm881
{
    var f = { Rand.ir(33, 2000) }.dup(2) * TRand.kr(0.125, 4, Impulse.kr(1 / 10, 0));
    var t = Impulse.kr(1 / 2 * TRand.kr(0.125, 4, Impulse.kr(1 / 5, 0)), 0);
    var a = EnvGen.kr(Env.perc(0.01, 1, 1, -4), t);
    FreeVerb.ar(Saw.ar(f) * a)
}.dup(32).sum * 0.1

// https://scsynth.org/t/5296 ; tm881
var a = Blip.ar(Rand.ir(1, 30) * TRand.kr(0.125, 4, Impulse.kr([1 / 4, 1 / 7], 0)) * XLine.kr(Rand.ir(0.125, 4), Rand.ir(0.125, 4), 15), 200);
GVerb.ar(Saw.ar(322) * a, 10, 0.3, 0.5, 0.5, 15, 1, 0.7, 0.5, 300) * 0.25
