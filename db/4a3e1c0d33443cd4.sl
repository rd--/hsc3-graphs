{- jmcc ; choip choip choip -}
let dur = 12;
let z = { :tr |
	let i = Impulse(
		TxLine(
			TExpRand(1, 30, tr),
			TExpRand(1, 30, tr),
			dur,
			tr
		),
		0
	);
	let f = TxLine(
		TExpRand(600, 8000, tr),
		TExpRand(600, 8000, tr),
		dur,
		tr
	);
	let o = SinOsc(Decay2(i, 0.05, 0.5) * -0.9 * f + f, 0);
	let l = TxLine(
		TExpRand(0.01, 0.5, tr),
		TExpRand(0.01, 0.5, tr),
		dur,
		tr
	);
	let s = Decay2(i * l, 0.01, 0.2) * o;
	EqPan2(s, TLine(TRand(-1, 1, tr), TRand(-1, 1, tr), dur, tr))
}.OverlapTexture(dur - 2, 1, 8).Mix;
4.timesRepeat {
	z := AllpassN(z, 0.1, { Rand(0, 0.05) } ! 2, 4)
};
z
