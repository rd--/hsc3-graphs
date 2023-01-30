;; Dseq ; shared dseq, different patterns ; keywords
var a = Dseq(repeats: inf, list: [1, 3, 2, 7, 8]);
var t = Impulse(freq: 5, phase: 0);
var f = Demand(trig: t, reset: 0, demandUGens: [a, a]) * 30 + 340;
SinOsc(freq: f, phase: 0) * 0.1
