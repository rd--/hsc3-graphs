/* Rocks on rails (Jmcc) ; Graph variant ; requires=LinRand */
let p = 20; /* Number of partials */
let n = 4; /* Number of overlapping events */
{ :tr |
	EqPan2(
		DynRingzBank( /* P resonant modes */
			Resonz(
				Dust(100) * 0.04, /* Excitation */
				XLine(3000, 300, 8), /* Sweep filter down */
				0.2 /* Band width ratio */
			),
			{ 200 + TLinRand(0, 3000, 0, tr) } ! p, /* Resonant frequencies */
			[1], /* Amplitudes */
			{ 0.2 + TRand(0, 1, tr) } ! p /* Ring times */
		),
		Line(TRand(-1, 1, tr), TRand(-1, 1, tr), 8) /* Sweep pan */
	)
}.OverlapTexture(2, 3, n).Mix * 0.5
