(* PanAz ; event control *)
var nc = 2;
Voicer(16) { :e |
	PanAz(
		nc,
		Blip(e.p.UnitCps, e.y * 3 + 1),
		e.i * 2 - 1,
		1,
		3,
		0
	) * e.w * e.z * e.z
}.Sum
