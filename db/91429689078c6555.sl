{- LfNoise2 ; modulate parameters -}
let n = 23;
let s = (1 .. n).collect { :i |
	let lf = 3 * (1.1 ^ i);
	let o1 = LfNoise2(lf) * SinOsc(ExpRand(0.08, 0.16), Rand(0, 1)).Range(0, 4);
	let o2 = SinOsc(
		ExpRand(0.08, 0.16),
		Rand(0, 1)
	).Range(0.3, 2) * i;
	let o3 = SinOsc(
		(35 + (i / n * 3) + o1 + o2).MidiCps,
		Rand(0, 1)
	) ^ 7;
	let e = LfNoise2(ExpRand(0.05, 2)).Range(0, 0.1) * Line(0, 1, i * 3 / 2);
	EqPan2(
		o3 ^ (i / 3),
		LfSaw(LfNoise2(lf) / i, Rand(0, 1))
	) * e
}.Sum;
FreeVerb2(s.first, s.second, 1 / 3, 0.5, 0.5)
