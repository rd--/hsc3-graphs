let trig = Impulse(24, 0);
let seq = Drand(2000, [
	Dseq(1, [1 .. 5].mirror1),
	Drand(8, [4 .. 10])
]) * Drand(2000, [1 1 1 2 2 2 4 4 8]);
let freq = Demand(trig, 0, seq * 100);
let osc = SinOsc(freq + [0 0.7], 0);
osc.Cubed.Cubed.ScaleNeg(MouseX(-1, 1, 0, 0.2)) * 0.1
