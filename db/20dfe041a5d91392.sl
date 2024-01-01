{ :tr |
	LinPan2(
		PmOsc(
			TRand(20, 2000, tr),
			TRand(0, 800, tr),
			TLine(0, TRand(0, 12, tr), 9, tr),
			0
		),
		TRand(-1, 1, tr),
		0.1
	)
}.OverlapTexture(2, 5, 4).Mix
