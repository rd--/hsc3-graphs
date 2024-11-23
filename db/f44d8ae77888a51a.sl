/********** Police state ; Jmcc **********/
let n = 4; /* number of sirens */
CombL(
	{
		EqPan2(
			SinOsc(
				SinOsc(0.1.Rand0 + 0.02, 2.pi.Rand0).MulAdd(600.Rand0, 1000 + 300.Rand2),
				0) * LfNoise2(100 + 20.Rand2) * 0.1,
			1.Rand2
		)
	} !> n
	+ LfNoise2(LfNoise2([0.4, 0.4]).MulAdd(90, 620)).Mul(LfNoise2([0.3, 0.3]).MulAdd(0.15, 0.18)),
	0.3, 0.3, 3)
