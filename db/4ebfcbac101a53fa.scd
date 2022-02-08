// chainsaw (jrhb)
var f = {
    arg saw;
	var rate = ExpRand.ir(0.1, 2);
	var freq = 0.6.coin.if({ LFNoise1.kr(rate.dup).exprange(0.01, 10)}, { LFNoise1.kr(rate.dup).exprange(10, 50) });
	var u1 = LFSaw.kr(LinExp.kr(saw, -1, 1, freq, freq * LFNoise1.kr(rate.dup).exprange(2, 10)));
	var u2 = 0.5.coin.if({ u1 * [1 - saw, saw.reverse].choose }, { u1 * LFSaw.kr(freq * 0.1, 0, 0.1, 1)	});
	u2.clip2(1.0)
};
var g = {
    arg func, n;
	n.do({ func = func <> func });
	func
};
var freq = g.value(f, 4).value(LFSaw.kr(0.2 * [1, 1.1])).exprange(6, 11000);
BPF.ar(Saw.ar(freq).product, [70, 800, 9000, 5242], 0.2).sum.dup * 0.3
