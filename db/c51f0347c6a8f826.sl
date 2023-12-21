(* Resonz ; PinkNoise ; event control *)
Voicer(16) { :e |
	var env = Perc(e.w, 0.01, 1 + e.j, -4);
	var freq = e.p.UnitCps;
	var rq = LinLin(e.y, 0, 1, 0.05, 0.25) / freq;
	var scl = 900;
	EqPan2(Resonz(PinkNoise(), freq, rq) * scl * e.z, e.i * 2 - 1) * env
}.Mix
