/* LinCongC ; texture */
{ :tr |
	let freq = SampleRate() / 2;
	let m = TiRand(0, 1000000, tr);
	let a = TiRand(1, 2000, tr);
	let c = TiRand(1, 30000, tr);
	LinCongC(freq, a, c, m, { TiRand(0, m, tr) } ! 2) * 0.1
}.OverlapTexture(1, 2, 4).Mix
