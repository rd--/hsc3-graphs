{- http://scsynth.org/t/7055 ; tmm881 ; rewrite for clarity &etc. -}
let mouse = [
	MouseX(0, 1, 0, 0.2),
	MouseY(0, 1, 0, 0.2)
];
let tendencyMask = [
	XLine(0.5, 50, 300),
	XLine(0.25, 25, 600),
	XLine(0.125, 12.5, 900)
];
{
	let modRate = {
		TRand(
			pi / 2,
			pi,
			Impulse(TRand(pi / 2, pi, Impulse(pi / 2, 0)), 0)
		)
	} ! 3;
	let mod = {
		TRand(
			tendencyMask * 0.125,
			tendencyMask * 4,
			Impulse(tendencyMask * modRate, 0)
		)
	} ! 2;
	let dur = 1:3.collect { :i |
		Rand(0.25, 4) * mod[1][i] * (mouse + 0.1).atRandom
	};
	let triggerRate = 1:3.collect { :i |
		Rand(0.25, 4) * mod[2][i] * (mouse / 10 + 0.1).atRandom
	};
	let freqMul = {
		(mouse * 10 + 0.1).atRandom
	} ! 3;
	let dry = 1:3.collect { :i |
		let freqRange = 10 ^ i * [22, 88] * freqMul[i];
		let freq = {
			TRand(
				freqRange[1],
				freqRange[2],
				Impulse(triggerRate[i], 0)
			) + [0, Rand(-1, 1)]
		} ! 2;
		let tr = Impulse(triggerRate[i], 0);
		GrainFm(2, tr, dur[i], freq[1], freq[2], 1, WhiteNoise() * 0.6, -1, 512) * 0.1
	}.Sum;
	let rev = FreeVerb(dry, 0.33, 0.5, 0.5);
	let del = CombC(dry, 0.2, 0.2, 1);
	dry + rev + del * 0.2
}.!(4).Sum.transposed.Mix
