;; Splay2 ; texture (Play)
OverlapTexture({ :tr |
	var k = 7;
	var o = SinOsc({ TiRand(40, 90, tr).MidiCps } ! k, 0);
	var a = { TRand(0.05, 0.1, tr) } ! k;
	Splay2(o * a)
}, 6, 3, 3)
