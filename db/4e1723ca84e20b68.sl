{ :tr |
	let exciter = WhiteNoise() * 0.001;
	{
		Ringz(
			exciter,
			TxLine(
				TExpRand(100, 5000, tr),
				TExpRand(100, 5000, tr),
				20,
				tr
			),
			0.5
		)
	} !^ 10
}.OverlapTexture(5, 10, 9).Mix
