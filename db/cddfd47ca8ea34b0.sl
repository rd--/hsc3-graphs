{- SinOsc ; event control ; x-field -}
Voicer(1, 16) { :e |
	EqPan2(SinOsc((e.x * 24 + 48).MidiCps, 0), e.i * 2 - 1) * e.z * e.w
}.Mix
