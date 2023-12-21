(* LinGen *)
Voicer(16) { :e |
	var freq = LinGen(e.w, e.p.UnitCps * [2, 2, 0.5], [0.01, 1]);
	SinOsc(freq, 0) * e.z * e.w
}.Sum
