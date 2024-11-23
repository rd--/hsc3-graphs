/* Resonz ; PinkNoise ; Event control */
Voicer(1, 16) { :e |
	let env = Perc(e.w, 0.01, 1 + e.j, -4);
	let freq = e.p.UnitCps;
	let rq = LinLin(e.y, 0, 1, 0.05, 0.25) / freq;
	let scl = 900;
	EqPan2(Resonz(PinkNoise(), freq, rq) * scl * e.z, e.i * 2 - 1) * env
}.Mix
