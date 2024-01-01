{ :tr |
	{
		SinOscBank(
			{ TRand(600, 1000, tr) } ! 8,
			0.1,
			{ TRand(0, 1, tr) } ! 8
		)
	} ! 2 * 0.1
}.XFadeTexture(3, 4)
