{ :tr |
	var freq = SampleRate() / 2;
	var m = TiRand(0, 1000000, tr);
	var a = TiRand(1, 2000, tr);
	var c = TiRand(1, 30000, tr);
	LinCongC(freq, a, c, m, { TiRand(0, m, tr) } ! 2) * 0.05
}.OverlapTexture(1, 2, 4).Mix