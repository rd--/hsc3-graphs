;; bowed string (jmcc) ; voicer
Voicer(16, { :e |
	var f = (e.x * 24 + 48).MidiCps;
	var k = DynRingzBank(
		{ BrownNoise() } ! 2 * e.z * LagUd(e.w, e.y * 0.1, e.y * 4),
		12.series(f, f),
		12.geom(1, Rand(0.7, 0.9)),
		{ Rand(1, 3) } ! 12
	);
	(k * 0.1).SoftClip
}).sum * 0.2
