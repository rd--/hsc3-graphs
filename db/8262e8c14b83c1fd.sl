/* Decay2 ; c.f. MultiTouchPad help file */
Voicer(1, 16) { :e |
	let impulseFreq = Choose(e.w, [1 2 3 4 6 8 9]);
	let oscFreq = TRand(80, 880, e.w);
	let mul = (1 - e.y) * e.w;
	let pan = (e.x * 2) - 1;
	let distort = e.z * 16;
	let decay = e.z * 2;
	let trig = Impulse(impulseFreq, 0);
	let snd = SinOsc(oscFreq, 0) * Decay2(trig, 0.01, 0.2 * decay);
	EqPan2(
		(snd * distort).Tanh / distort,
		pan.Lag(0.1)
	) * mul.Lag(0.1)
}.Mix
