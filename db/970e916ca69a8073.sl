{- Plucked strings (Jmcc) -}
{ :tr |
	let i = {
		let s0 = Impulse(TRand(2, 2.2, tr), 0) * 0.3;
		let s1 = Dust(0.5) * 0.3;
		let s2 = Impulse(
			SinOsc(TRand(0.05, 0.15, tr), TRand(0, pi * 2, tr)) * 5 + 5.2,
			0
		) * 0.3;
		Choose(tr, [s0, s1, s2])
	};
	{
		let dt = 1 / TRand(60, 90, tr).Floor.MidiCps;
		let t = Decay(i(), 0.1) * PinkNoise() * 0.1;
		EqPan2(CombL(t, dt, dt, 4), TRand(-1, 1, tr))
	} !+ 5
}.OverlapTexture(7, 5, 3).Mix
