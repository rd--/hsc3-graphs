{ :tr |
	let freq = TRand(400, SampleRate() / 3, tr);
	let a = TRand(-3, 3, tr);
	let b = TRand(-3, 3, tr);
	let c = TRand(0.5, 1.5, tr);
	let d = TRand(0.5, 1.5, tr);
	let l = LatoocarfianC(freq, a, b, c, d, 0.5, 0.5);
	SinOsc(freq, 0) * 0.05 + Pan2(l, TRand(-1, 1, tr), 0.05)
}.OverlapTexture(1, 4, 8).Mix
