// https://www.listarc.cal.bham.ac.uk/lists/sc-users-2002/msg00534.html ; f0 ; edit (rd, duplicated) ; requires=SfAcquire
{
	var b = SfAcquire("floating_1", 1, [1]);
	// k-rate noise is linearly interpolated to audio rate phase
	var a = (LFNoise1.kr(1.6) * 10000).round((LFNoise0.kr(0.1) * 6400).abs);
	var z = {
		AllpassL.ar(
			EqPan2.ar(SfRead.ar(b, K2A.ar(a), 1, 2), a / 10000),
			0.1,
			{ Rand.ir(0, 0.1) } ! 2,
			LFNoise1.ar(0.1) * 0.4 + 0.4
		).sum
	} ! 2;
	LeakDC.ar(z, 0.995)
} !+ 2
