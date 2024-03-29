{- Mix ; rule based mixing ; system preference -}
let n = 9;
{ :tr |
	let ping = SinOsc(2222, 0) * Decay2(tr, 0.01, 0.2);
	let sine = SinOsc(TRand(22, 333, tr), 0);
	EqPan2(
		[ping, sine],
		[-1, TRand(-1, 1, tr)]
	).Sum * [0.1, 0.05]
}.OverlapTexture(n, 0, n).Mix
