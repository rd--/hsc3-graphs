// cymbalism accellerando ; jmcc #2 ; graph rewrite
var p = 15;
OverlapTexture({ |tr|
	var i = Impulse.ar(TxLine.kr(TRand.kr(0, 4, tr) + 0.5, TRand.kr(0, 35, tr) + 0.5, 12, tr), 0);
	var s = Decay.ar(i, 0.004) * WhiteNoise.ar * 0.03;
	var f1 = TRand.kr(500, 2500, tr);
	var f2 = TRand.kr(0, 8000, tr);
	{ { Ringz.ar(s, f1 + TRand.kr(0, f2, tr), TRand.kr(1, 5, tr)) }.dup(p).sum }.dup(2)
}, 4, 4, 3) * 0.1
