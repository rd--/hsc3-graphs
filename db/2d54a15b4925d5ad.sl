(* Freezer ; k-rate instance *)
let sf = SfAcquireMono('crotale-d6');
let n = { :i :j |
	LfNoise2(0.1).LinLin(-1, 1, i, j)
};
Freezer(
	sf,
	n(0.3, [0.4 0.5]),
	n(0.5, [0.6 0.7]),
	n(0.3, [0.6 0.8]),
	n(0.95, 1.05),
	n(0.05, 0.15),
	n(0.05, 0.15),
	n(0.05, 0.15),
	0,
	0,
	36
)
