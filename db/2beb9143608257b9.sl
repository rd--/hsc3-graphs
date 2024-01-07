let exciter = WhiteNoise() * 0.001;
{
	Ringz(
		exciter,
		XLine(
			ExpRand(100, 5000),
			ExpRand(100, 5000),
			20
		),
		0.5
	)
} !^ 10
