{- http://sccode.org/1-4Qy (F0) ; tweet0003 ; texture variant ; requires=LinRand -}
{ :tr |
	let t = SinOsc(
		TRand(1, 999, tr),
		0
	).Abs;
	{
		Formlet(
			TDuty(t, 0, t),
			TLinRand(20, 4000, 0, tr),
			t,
			1 - t
		)
	} ! 2
}.OverlapTexture(15, 1, 8).Mix
