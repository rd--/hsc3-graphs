{ :tr |
	EqPan(
		SinOsc(TiRand(48, 72, tr).MidiCps, 0),
		TRand(-1, 1, tr)
	) * 0.1
}.XFadeTexture(2, 0.5)
