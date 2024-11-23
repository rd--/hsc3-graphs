/* Cymbalism accellerando (Jmcc) #2 ; Graph rewrite */
let p = 15;
{ :tr |
	let i = Impulse(
		TxLine(
			TRand(0, 4, tr) + 0.5,
			TRand(0, 35, tr) + 0.5,
			12,
			tr
		),
		0
	);
	let s = Decay(i, 0.004) * WhiteNoise() * 0.03;
	let f1 = TRand(500, 2500, tr);
	let f2 = TRand(0, 8000, tr);
	{
		{
			Ringz(s, f1 + TRand(0, f2, tr), TRand(1, 5, tr))
		} !+ p
	} ! 2
}.OverlapTexture(4, 4, 3).Mix * 0.1
