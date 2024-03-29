{- Hard sync sawtooth with lfo (Jmcc) #6 ; graph-rewrite -}
let txt = { :tr |
	let f = (30 + TRand(0, 50, tr)).MidiCps;
	SyncSaw(
		[f, f + 0.2],
		SinOsc(0.2, { TRand(0, 2.pi, tr) } ! 2) * 2 * f + (3 * f)
	) * 0.05
}.OverlapTexture(4, 4, 4).Mix;
CombN(txt, 0.3, 0.3, 4) + txt.reversed
