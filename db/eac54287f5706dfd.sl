(* Blip ; requires=Voicer (event control) *)
Voicer(16) { :e |
	var o = Blip((e.x * 13 + 48).MidiCps, e.y * 19 + 1);
	EqPan2(o, e.i * 2 - 1) * e.z * e.w * 0.5
}.Mix
