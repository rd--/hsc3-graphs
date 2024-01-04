{ :tr |
	SinOsc({ TiRand(48, 72, tr).MidiCps } ! 7, 0).Splay * 0.1
}.OverlapTexture(4, 4, 2).Mix
