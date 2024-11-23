/* Decay2 ; c.f. MultiTouchPad help file */
{
	let tr = Dust(1 / 9);
	let impulseFreq = Choose(tr, [1 2 3 4 6 8 9]);
	let oscFreq = TRand(20, 880, tr);
	let distort = TRand(0.1, 8, tr);
	let env = Decay2(Impulse(impulseFreq, 0), 0.01, 0.2 * TRand(0.1, 1, tr));
	let snd = SinOsc(oscFreq, 0) * env;
	EqPan2(
		(snd * distort).Tanh / distort,
		TRand(-1, 1, tr)
	) * TxLine(TRand(0.2, 0.5, tr), 0.001, TRand(3, 7, tr), Impulse(0, 0) + tr)
} !> 16
