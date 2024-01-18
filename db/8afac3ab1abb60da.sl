{- CombL ; array expansion (interior duplication) -}
let n = 8;
EqPan2(
	CombL(
		{ Dust(1) * 0.3 } ! n,
		0.01,
		{ Rand(0.0040, 0.0043) } ! n,
		4
	),
	{ Rand(-1, 1) } ! n
).Mix
