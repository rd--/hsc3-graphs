(* https://sccode.org/1-50L (mk) *)
var z = PinkNoise();
var lfo = { :rt | LfNoise1(rt ! 2) };
16.timesRepeat {
	z := Brf(
		z,
		Rand(100, 15000) * (0.75 + (lfo(Rand(0, 8)) * 0.25)),
		lfo(Rand(0, 8)).Range(0.05, 1)
	)
};
z
