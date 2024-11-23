/* SinOsc ; Event control ; p */
Voicer(1, 16) { :e |
	SinOsc(e.p.UnitCps, 0) * e.w * e.z
}.Splay
