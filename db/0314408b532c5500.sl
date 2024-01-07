let trig = Impulse(8, 0);
let seq = Drand(inf, [
	Dseq(1, [4 0 0 1 2 1 0 1]),
	Dseq(1, [4 0 2 0 1 0 1 1]),
	Dseq(1, [4 0 0 2 0 0 1 1]),
	Dseq(1, [4 0 1 2 0 1 2 0]),
	Dseq(1, [4 1 1 1 2 2 3 3]),
	Dseq(1, [4 1 0 1 0 1 0 1])
]);
let trigSeq = Demand(trig, 0, seq * 0.4) * trig;
{ Lpf(PinkNoise(), 5000) } ! 2 * Decay(trigSeq, 0.5)
