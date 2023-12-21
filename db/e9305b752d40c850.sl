(* SinOsc ; event control ; p-field *)
Voicer(16) { :e |
	SinOsc(e.p.UnitCps, 0) * e.w * e.z
}.Splay
