{- random sine waves (jmcc) #1 ; graph rewrite -}
{ :tr |
	EqPan2(
		SinOsc(TRand(20, 2000, tr), 0),
		TRand(-1, 1, tr)
	) * 0.05
}.OverlapTexture(5, 2, 9).Mix
