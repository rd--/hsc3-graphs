/* SinOsc */
{
	let tr = Dust(1);
	let freq = TRand(3785, 3800, tr);
	let amp = SinOsc(TRand(10, 30, tr), 0) * 0.2;
	let osc = SinOsc(freq, 0) * amp + SinOsc({ TRand(2.91, 3.02, tr) } ! 2 * freq, 0);
	let env = Decay2(tr, 0.01, 1);
	osc * env * 0.4
} !> 12
