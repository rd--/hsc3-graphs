(* Formant ; requires=Voicer *)
Voicer(1, 16) { :e |
	var f0 = [200 300 400 500] * e.x;
	var ff = LinExp(e.y, 0, 1, 400, 1200);
	Splay2(Formant(f0, ff, 200) * LagUd(e.w, 0.01, 1) * e.z)
}.Mix
