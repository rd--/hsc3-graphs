;; Dseq ; distinct dseq, equal patterns
var a = Dseq(inf, [1, 3, 2, 7, 8]);
var b = Dseq(inf, [1, 3, 2, 7, 8]);
var t = Impulse(5, 0);
var f = Demand(t, 0, [a, b]) * 30 + 340;
SinOsc(f, 0) * 0.1
