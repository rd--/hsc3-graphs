/* Blip ; Event control */
Voicer(1, 16) { :e |
	EqPan2(Blip(e.p.UnitCps, e.i * 10 + 1), e.j * 2 - 1) * e.w * e.z / 9
}.Mix
