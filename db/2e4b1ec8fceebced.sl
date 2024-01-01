var z = AudioIn([1, 2]).Sum;
var f = Pitch(z, 440, 60, 4000, 100, 16, 7, 0.02, 0.5, 1, 0);
var s = VarSaw(
	f.first * [0.5, 1, 2],
	0,
	LfNoise1(0.3) * 0.1 + 0.1
) * 0.1;
6.timesRepeat {
	s := AllpassN(s, 0.040, { Rand(0, 0.04) } ! 2, 2)
};
s
