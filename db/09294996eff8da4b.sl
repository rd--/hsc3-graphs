/* Repeating inharmonic klank (Jmcc) #6 ; Graph rewrite */
let n = 4;
let p = 8;
{ :tr |
	let s = Decay(Dust(0.8) * 0.004, 3.4) * LfSaw(TRand(0, 40, tr), 0);
	{
		RingzBank(
			s,
			{ TRand(80, 10000, tr) } ! p,
			1,
			{ TRand(0.4, 4.4, tr) } ! p
		)
	} ! 2
}.OverlapTexture(8, 8, n).Mix
