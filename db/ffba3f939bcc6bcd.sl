{- Resonz ; resonator -}
{ :tr |
	Resonz(
		Pulse(TRand(2, 7, tr), 0.5),
		{ TExpRand(120, 2500, tr) } ! 4,
		0.005
	).Splay2
}.OverlapTexture(2, 4, 6).Mix
