/* https://sccode.org/1-50L (mk) */
let z = PinkNoise();
16.timesRepeat {
	z := Brf(z, { Rand(100, 15000) } ! 2, 1)
};
z
