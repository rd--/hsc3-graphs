(* Pluck ; event control ; requires=voicer *)
Voicer(1, 16) { :e |
	var dm = 1 / 220;
	var dl = (e.x.negated * 0.9 + 1) * dm;
	var sig = Pluck(WhiteNoise() * e.z, e.w, dm, dl, 10, e.y / 3);
	EqPan2(sig, e.i * 2 - 1)
}.Mix
