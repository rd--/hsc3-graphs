/* Babbling brook (Jmcc) #SC3 ; left-to-right */
let b = { :f :m :a :g |
	BrownNoise()
		.OnePole(0.99)
		.Rhpf(BrownNoise()
			.Lpf(f)
			.MulAdd(m, a), 0.03)
		.Mul(g)
};
[
	{ b(14, 400, 500, 0.06) } ! 2,
	{ b(20, 800, 1000, 0.10) } ! 2
].Sum
