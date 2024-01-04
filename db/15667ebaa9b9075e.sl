(* bowed string (jmcc) ; voicer *)
Voicer(1, 16) { :e |
	var f = (e.x * 24 + 48).MidiCps;
	var k = DynRingzBank(
		BrownNoise() * e.z * LagUd(e.w, e.y * 0.1, e.y * 4),
		12.arithmeticSeries(f, f),
		12.geometricSeries(1, Rand(0.7, 0.9)),
		{ Rand(1, 3) } ! 12
	);
	(k * 0.1).SoftClip.EqPan2(e.i * 2 - 1)
}.Mix * 0.1
