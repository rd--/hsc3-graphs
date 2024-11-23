/* Tarmac ; Jmcc ; edit (Rd) */
let z = { :tr |
	EqPan2(
		RingzBank(
			PinkNoise() * 0.0008,
			{ LinRand(700, 6000, 0) } ! 4,
			nil,
			{ LinRand(0.2, 12, 0) } ! 4
		),
		LfNoise1(1.Rand0)
	) * LfNoise1(LfNoise1(1).MulAdd(3, 4)).MulAdd(0.4, 0.6)
}.OverlapTexture(8, 3, 4).Sum;
6.timesRepeat {
	z := AllpassN(z, 0.040, [0.04.Rand0, 0.04.Rand0], 16)
};
z
