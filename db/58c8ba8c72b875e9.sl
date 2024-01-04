(* Dseq ; shared Dseq, different patterns *)
var a = Dseq(inf, [1, 3, 2, 7, 8]);
var t = Impulse(5, 0);
var f = Demand(t, 0, [a, a]) * 30 + 340;
SinOsc(f, 0) * 0.1
