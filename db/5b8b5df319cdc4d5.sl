(* Dshuf ; embedded structures *)
var seq = Dseq(inf, [
	Dshuf(8, [
		Drand(1, [1, 2, 3]),
		3,
		Drand(1, [20, 23, 56]),
		7,
		8.5
	])
]);
var trig = Impulse(MouseX(1, 40, 1, 0.2), 0);
var freq = Demand(trig, 0, seq) * 30 + 340;
SinOsc(freq, 0) * 0.1
