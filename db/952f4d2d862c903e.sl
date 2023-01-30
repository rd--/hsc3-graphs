;; Pluck ; event control ; requires=voicer
Voicer(16, { :e |
	var dm = 1 / 220;
	var dl = (e.x.negated * 0.9 + 1) * dm;
	var sig = Pluck(WhiteNoise() * e.z, e.w, dm, dl, 10, e.y / 3);
	EqPan2(sig, e. o * 2 - 1)
}).sum
