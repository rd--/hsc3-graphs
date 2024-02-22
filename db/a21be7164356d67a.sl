{- SinOsc -}
SinOsc(
	LfNoise2(
		SinOsc([3, 5], 0).LinLin(-1, 1, [2, 7], 35)
	).LinLin(-1, 1, 100, [200, 300]),
	0
) * 0.1
