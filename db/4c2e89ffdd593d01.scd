// https://scsynth.org/t/5296 ; tm881
var a = Blip.ar(Rand(1, 30) * TRand.kr(0.125, 4, Impulse.kr([1 / 4, 1 / 7], 0)) * XLine.kr(Rand(0.125, 4), Rand(0.125, 4), 15), 200);
GVerb.ar(Saw.ar(322) * a, 10, 0.3, 0.5, 0.5, 15, 1, 0.7, 0.5, 300) * 0.25
