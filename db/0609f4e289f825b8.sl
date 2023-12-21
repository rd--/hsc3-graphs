(* Blip ; event control *)
Voicer(16) { :e |
	EqPan2(Blip(e.p.UnitCps, e.y * 10 + 1), e.i * 2 - 1) * e.w * e.z * e.z
}.Mix
