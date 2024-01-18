{- Hard sync sawtooth with lfo (Jmcc) #6 ; graph-rewrite ; left-to-right -}
let txt = { :tr |
	let f = TRand(0, 50, tr).MulAdd(1, 30).MidiCps;
	SyncSaw(
		[f, f + 0.2],
		SinOsc(0.2, { TRand(0, pi, tr).Mul(2) } ! 2).Mul(2).MulAdd(f, f * 3)
	).Mul(0.05)
}.OverlapTexture(4, 4, 4).Mix;
txt.CombN(0.3, 0.3, 4) + txt.reversed
