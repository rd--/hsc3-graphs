(* Dseq ; shared dseq, different patterns ; requires=keywords *)
let a = Dseq(repeats: inf, list: [1, 3, 2, 7, 8]);
let t = Impulse(freq: 5, phase: 0);
let f = Demand(trig: t, reset: 0, demandUgens: [a, a]) * 30 + 340;
SinOsc(freq: f, phase: 0) * 0.1
