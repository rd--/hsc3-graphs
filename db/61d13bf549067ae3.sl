(* Dshuf *)
var seq = Dseq(inf, [Dshuf(3, [1 3 2 7 8.5])]);
var trig = Impulse(MouseX(1, 40, 1, 0.2), 0);
var freq = Demand(trig, 0, seq) * 30 + 340;
SinOsc(freq, 0) * 0.1