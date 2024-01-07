(* sc-140 ; 01 ; Nathaniel Virgo *)
let a =
	CombN(
		Bpf(
			LocalIn(2, 0) * 7.5 + (Saw([32, 33]) * 0.2),
			2 ^ (LfNoise0(4 / 3) * 4) * 300,
			0.1
		).Distort,
		2,
		2,
		40
	);
a <! LocalOut(a)
