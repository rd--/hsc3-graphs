{- http://www.listarc.cal.bham.ac.uk/lists/sc-users-2002/msg00534.html (F0) ; edit (rd, duplicated) ; requires=SfAcquire -}
{
	let b = SfAcquireMono('floating_1');
	{- K-rate noise is linearly interpolated to audio rate phase -}
	let a = (LfNoise1(1.6) * 10000).RoundTo((LfNoise0(0.1) * 6400).Abs).kr;
	let z = {
		AllpassL(
			EqPan2(SfRead(b, K2A(a), 1, 2), a / 10000),
			0.1,
			{ Rand(0, 0.1) } ! 2,
			LfNoise1(0.1) * 0.4 + 0.4
		).Sum
	} ! 2;
	LeakDc(z, 0.995)
} !> 2
