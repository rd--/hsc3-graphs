/* MoogFF ; Voicer */
Voicer(1, 16) { :e |
	let freq = e.x.UnitCps;
	let osc = {
		Saw(freq * TRand(0.99, 1.01, e.w)) * 0.75
	} !+ 8;
	let filterEnv = Adsr(e.w, 0.02, 0.1, 0.05, 1, -4);
	MoogFf(osc, e.y * 750 + 250 * filterEnv, e.j * 4, 0) * e.w.LagUd(0.01, 4) * 2
}.Splay
