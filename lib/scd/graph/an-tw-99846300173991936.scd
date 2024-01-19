// https://twitter.com/alln4tural/status/99846300173991936 ; graph rewrite
OverlapTexture({ |tr|
	var h = TChoose.kr(tr, [33, 38, 40]).midicps * (2 ** TChoose.kr(tr, (0 .. 5)));
	Splay.ar({
		SinOsc.ar(TExpRand.kr(h - (h / 256), h + (h / 256), tr), 0) * 0.025
	} ! 64)
}, 1, 9, 5)

// https://twitter.com/alln4tural/status/99846300173991936 ; graph rewrite
OverlapTexture({ |tr|
	var h = TChoose.kr(tr, [33, 38, 40]).midicps * (2 ** TChoose.kr(tr, (0 .. 4)));
	Splay.ar({
		SinOsc.ar(TExpRand.kr(h - (h / 64), h + (h / 64), tr), 0) * 0.025
	} ! 8)
}, 1, 9, 40)
