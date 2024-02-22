{ :tr |
	let x = MouseX(0.15, 0.85, 0, 0.2);
	let f0 = Choose(tr, [110 220 440]);
	{
		let freq = f0 + TRand(0, f0, tr);
		let fb = LfNoise2(1).LinLin(-1, 1, 0, x);
		EqPan(SinOscFb(freq, fb), TRand(-1, 1, tr)) / 16
	} !+ 16
}.OverlapTexture(2, 6, 3).Mix
