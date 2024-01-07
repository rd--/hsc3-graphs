(* Repeating harmonic klank (Jmcc) *)
{ :tr |
	let p = 8;
	let s = Decay(Dust(0.8) * 0.01, 3.4) * LfSaw(TRand(0, 40, tr), 0); (* linrand *)
	let f = Choose(tr, [400, 500, 600, 700, 800, 900, 1000, 1200, 1400, 1500, 1600]);
	{
		RingzBank(
			s,
			{ f * TRand(1, 13, tr) } ! p,
			[1],
			{ TRand(0.4, 3.4, tr) } ! p
		)
	} ! 2
}.OverlapTexture(8, 2, 4).Mix
