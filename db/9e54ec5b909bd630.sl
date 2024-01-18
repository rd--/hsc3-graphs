{- CombL ; exterior duplication -}
let n = 8;
{
	EqPan(
		CombL(
			Dust(1) * 0.3,
			0.01,
			Rand(0.0040, 0.0043),
			4
		),
		Rand(-1, 1)
	)
} !+ n
