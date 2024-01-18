{- Sine ; texture -}
{ :tr |
	let freq = { TiRand(5, 23, tr) } ! 2 * 17;
	let dur = { TiRand(3, 7, tr) } ! 2;
	SinOsc(freq, 0) * Sine(tr, dur) / 7
}.OverlapTexture(3, 5, 8).Mix
