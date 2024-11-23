/* Sawed cymbals (Jmcc) ; #10 ; Graph rewrite */
let p = 15;
{ :tr |
	let f1 = TRand(500, 2500, tr);
	let f2 = TRand(0, 8000, tr);
	let f3 = TxLine(TRand(0, 600, tr), TRand(0, 600, tr), 12, tr);
	let s = LfSaw(f3, 0) * 0.0005;
	{
		RingzBank(
			s,
			{ f1 + TRand(0, f2, tr) } ! p,
			nil,
			{ TRand(2, 6, tr) } ! p
		)
	} ! 2 * 0.1
}.OverlapTexture(4, 4, 6).Mix
