// Dseq ; distinct dseq, equal patterns
var a = Dseq(list: [1,3,2,7,8], repeats: inf);
var b = Dseq(list: [1,3,2,7,8], repeats: inf);
var t = Impulse.kr(freq: 5, phase: 0);
var f = Demand.kr(trig: t, reset: 0, demandUGens: [a,b]) * 30 + 340;
SinOsc.ar(freq: f, phase:  0) * 0.1
