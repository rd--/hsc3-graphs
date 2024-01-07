let trig = TDuty(
	Drand(inf, [0.01 0.2 0.4 0.3]),
	0,
	Dseq(inf, [0.1 0.4 0.01 0.1 1])
);
Ringz(trig, 1000, 1) * 0.1
