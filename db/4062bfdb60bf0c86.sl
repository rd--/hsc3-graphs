{- Data space (Jmcc) #2 ; Graph rewrite -}
{ :tr |
	let dt = TRand(0, 0.25, tr) + 0.1;
	let osc = { :n :m |
		let e = MulAdd(
			LfPulse(TRand(0, m, tr), 0, TRand(0, 1, tr)),
			TRand(0, 8000, tr),
			TRand(0, 2000, tr)
		);
		LfPulse(TRand(0, n, tr), 0, TRand(0, 1, tr)) * e
	};
	let freq = osc(200, 40) + osc(20, 4) + osc(20, 4);
	CombL(
		EqPan2(LfPulse(freq, 0, 0.5), LfNoise0(TRand(0, 3, tr)) * 0.8),
		dt,
		dt,
		3
	) * 0.04
}.OverlapTexture(6, 1, 4).Mix
