{- Vosim ; requires=voicer -}
Voicer(1, 16) { :e |
	let tr = Impulse(e.p.UnitCps, 0);
	let freq = LinExp(e.y, 0, 1, 440, 880);
	EqPan2(Vosim(tr, freq, e.k + 1 * e.y * 12, e.j), e.i * 2 - 1) * e.w * e.z
}.Mix
