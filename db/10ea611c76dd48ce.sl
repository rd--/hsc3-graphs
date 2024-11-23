/* Dseq ; shared Dseq, different patterns */
let a = Dseq(inf, [1, 3, 2, 7, 8]);
let t = Impulse(5, 0);
let f = Demand(t, 0, [a, a]) * 30 + 340;
SinOsc(f, 0) * 0.1
