// https://twitter.com/redFrik/status/1319946903711338496 ; graph rewrite (rd)
var c = [0, 0.804, 1.944, 3.084, 3.888, 5.028, 5.832, 6.972, 7.776, 8.916, 10.056, 10.86];
OverlapTexture({ |tr|
	var i = PulseCount.kr(tr, 0);
	var z = {
		var f = LFTri.kr(1 / 99, 0) * 9 + (12 * TRand.kr(3, 6, tr) + Select.kr(TChoose.kr(tr, [0, 2, 3, 5, 7, 8, 10]), c)).midicps;
		var y = SinOscFB.ar(f, LFTri.kr(1 + i / 50, 0) + 1 / 2);
		Pan2.ar(y, LFTri.kr(i / 70, 0), TRand.kr(0, 1, tr) > 0.5 / 2)
	}.dup(9).sum;
	CombN.ar(z, 0.2, 0.2, 1).tanh * 0.1
}, 3, 9, 2)
