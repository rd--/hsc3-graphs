{- Gendy1 ; texture -}
{
	EqPan(
		SinOsc(
			Gendy1(
				IRand(0, 6),
				IRand(0, 6),
				SinOsc(0.1, 0) * 0.49 + 0.51,
				SinOsc(0.13, 0) * 0.49 + 0.51,
				Rand(130, 160.3),
				Rand(130, 160.3),
				SinOsc(0.17, 0) * 0.49 + 0.51,
				SinOsc(0.19, 0) * 0.49 + 0.51,
				12,
				12
			) * 200 + 400,
			0
		),
		Rand(-1, 1)
	) * 0.1
} !+ 10
