// https://twitter.com/HernaniVillase/status/517517924236795905 ; rewrite (rd)
OverlapTexture({ |tr|
	var f = TRand.kr(97, 101, tr);
	var o = LFTri.ar(
		{ TRand.kr(0, 200, tr) + 216 } ! 8 + f,
		{ TRand.kr(0, pi * 2, tr) } ! 8
	);
	var e = LFTri.ar(
		{ TRand.kr(0, 0.01, tr) + 0.1 } ! 8,
		0
	) * 0.1 + 0.01;
	Splay.ar(o * e)
}, 4, 4, 2)
