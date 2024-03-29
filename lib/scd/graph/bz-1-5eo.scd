// https://sccode.org/1-5eo (bz) ; bohlen pierce scale ; graph edit
OverlapTexture({ |tr|
	var dev = TRand.kr(0.2, 0.4, tr);
	var root = TChoose.kr(tr, #[30, 32, 35, 37]);
	var buffer = [1, 9/7, 7/5, 5/3, 9/5, 15/7, 7/3, 25/9, 3, 27/7, 21/5, 15/3, 27/5, 45/7, 21/3, 75/9, 9].asLocalBuf;
	var lfo = LFBrownNoise1.kr(4, dev, 0) * 4 + 5;
	var index = IndexInBetween.kr(buffer,  lfo).round;
	var intv = Index.kr(buffer,  index);
	Splay.ar({
		var freq = Lag.kr(intv, 0.1) * root * (LFNoise2.ar(12) * 0.02 + 1);
		var env = (LFNoise2.ar(4) * 0.4 + 0.6) ** 2;
		MoogLadder.ar(Saw.ar(freq) * env, LFNoise2.ar(1, 1700, 2200), 0.3)
	}.dup(8)) * 0.5
}, 4, 4, 4)
