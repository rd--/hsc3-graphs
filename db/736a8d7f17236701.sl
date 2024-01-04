var trig = TDuty(
	MouseX(0.1, 0.5, 1, 0.2),
	0,
	Dseq(inf, [0.1 0.4 0.01 0.1 1])
);
Ringz(trig, 1000, 1) * 0.1
