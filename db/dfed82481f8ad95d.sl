{- Dc ; Silence at first eight channels, random sine tones at next eight -}
{ :tr |
	let p = { Dc(0) } ! 8;
	let q = { SinOsc(TRand(220, 880, tr), 0) } ! 8;
	(p ++ q) * 0.1
}.OverlapTexture(2, 5, 2).Sum
