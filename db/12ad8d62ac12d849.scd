// http://sccode.org/1-9 (jl)
var n = 956;
var a = HPF.ar(PinkNoise.ar() * 0.005, 10) * Line.kr(0, 1, 9);
var f = { arg i; Ringz.ar(a * LFNoise1.kr(0.05 + Rand(0, 0.1)), 55 * (i + n) + 60, 0.2) };
GVerb.ar((f.dup(99)).sum, 70, 990, 0.5, 0.5, 15, 1, 0.7, 0.5, 300).tanh
