{- SparseMatrixMixer ; randomly copy from 4-channel input to 24-channel output -}
{ :tr |
	SparseMatrixMixer(
		24,
		{
			SinOsc(TRand(220, 550, tr), 0)
		} ! 4,
		{
			[
				1:4.atRandom,
				1:24.atRandom,
				0.01 + 0.05.atRandom
			]
		} ! 6
	)
}.OverlapTexture(6, 5, 4).Sum
