{ :tr |
	{
		{
			SinOsc(
				TRand(600, 1000, tr),
				TRand(0, 1, tr)
			) * 0.1
		} !+ 8
	} ! 2 * 0.1
}.XFadeTexture(3, 4)
