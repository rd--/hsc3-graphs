{ :tr |
	var z = Decay(
		Impulse(4, 0),
		TRand(0.03, 0.09, tr)
	) * ClipNoise() * 0.0025;
	var r = RingzBank(
		z,
		{ TRand(800, 4000, tr) } ! 12,
		nil,
		{ TRand(0.1, 2, tr) } ! 12
	);
	EqPan2(r, TRand(-1, 1, tr))
}.OverlapTexture(8, 3, 4).Mix
