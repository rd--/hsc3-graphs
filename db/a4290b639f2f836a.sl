let d = Dswitch(
	Dseq(2, [0 1 2 1 0]),
	[
		Dwhite(2, 3, 4),
		Dwhite(2, 0, 1),
		Dseq(2, [1 1 1 0])
	]
);
let trig = Impulse(4, 0);
SinOsc(
	Demand(trig, 0, d) * 300 + 400,
	0
) * 0.1 # 2
