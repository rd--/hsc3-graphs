{- Blip ; requires=Voicer (event control) -}
Voicer(1, 16) { :e |
	let o = Blip((e.x * 13 + 48).MidiCps, e.y * 19 + 1);
	EqPan2(o, e.i * 2 - 1) * e.z * e.w * 0.5
}.Mix
