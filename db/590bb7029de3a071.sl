{ :tr |
	{ SinOsc(TiRand(48, 72, tr).MidiCps, 0) } !^ 7 * 0.1
}.OverlapTexture(4, 4, 2).Mix
