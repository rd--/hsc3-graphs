{- Resonant dust (Jmcc) #2 ; Graph rewrite -}
{ :tr |
	let rf1 = TRand(0, 2000, tr) + 80;
	let rf2 = rf1 + (TRand(-0.5, 0.5, tr) * rf1);
	let d = Dust(50 + TRand(0, 800, tr));
	let s = Resonz(d, TxLine(rf1, rf2, 9, tr), 0.1);
	EqPan2(s, TRand(-1, 1, tr)) * 0.3
}.OverlapTexture(5, 2, 4).Mix
