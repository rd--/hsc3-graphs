{- MoogVcf ; Voicer -}
Voicer(1, 16) { :e |
	let freq = e.p.UnitCps;
	let osc = {
		Saw(freq * TExpRand(0.99, 1.01, e.w))
	} !+ 8;
	let amp = e.z * 2 * e.w.LagUd(0.02, 4);
	MoogVcf(osc, SinOsc(e.y, 0).ExpRange(freq * 2, freq * 4), e.j) * amp
}.Splay
