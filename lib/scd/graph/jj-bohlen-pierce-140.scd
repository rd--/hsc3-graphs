// jj ; bohlen-pierce ; texture graph variant
OverlapTexture({
	arg tr;
	var f = { arg x; x * 3.pow(TRand.kr(0, 17, tr) / 13) };
	var e = EnvGen.ar(Env.perc(0.01, 1, 1, -4), tr, 0.1, 0, 1, 0);
	PMOsc.ar(f.value([438, 442]), f.value(880), f.value(e)) * e
}, 1 / 3, 0, 4)
