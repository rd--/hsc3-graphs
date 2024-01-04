(* Resonz ; PinkNoise ; event control *)
Voicer(1, 16) { :e |
	EqPan2(
		Resonz(
			PinkNoise(),
			e.p.UnitCps,
			e.y * 0.25) * 24,
		e.i * 2 - 1
	) * e.z * e.w
}.Mix
