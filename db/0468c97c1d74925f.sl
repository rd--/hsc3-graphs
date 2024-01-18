{- Alien froggies (Jmcc) #1 ; left-to-right -}
{ :tr |
	let TrRand = { :tr :lo :hi | TRand(lo, hi, tr) };
	let TrExpRand = { :tr :lo :hi | TExpRand(lo, hi, tr) };
	let r = tr.TrRand(-0.2, [0.1, 0.2]).Exp.Mul(11).Fold(1, 30);
	r.Formant(
		tr.TrExpRand([200, 300], 3000),
		tr.TrRand([0, 1], 9).MulAdd(r, r)
	).Mul(0.05)
}.OverlapTexture(0.5, 0.25, 5).Mix
