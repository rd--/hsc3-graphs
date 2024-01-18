// https://twitter.com/rukano/status/98315246548172800 ; texture variant
OverlapTexture({
	arg tr;
	var h = TChoose.kr(tr, [100, 800, 3000]);
	var o = { SinOsc.ar(TExpRand.kr(60, h, tr), 0) * 0.1 };
	Splay.ar(o.dup(40))
}, 5, 7, 2)
