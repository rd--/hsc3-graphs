(* Line *)
var octaves = 12 * (5 .. 7);
octaves.collect { :m0 |
	var m1 = m0 + [0, 4.078, 7.019, 11.097];
	var m2 = m0 + [0, 4.980, 7.921, 10.863];
	var du = 90;
	var o = (1 .. 4).collect { :index |
		EqPan2(
			SinOsc(Line(m1[index], m2[index], du).MidiCps, 0),
			Line(1.Rand2, 1.Rand2, du)
		) * Line(0.1.Rand, 0.1.Rand, du)
	};
	o.Sum
}.Mix * 0.2
