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

//---- chainsaw (jrhb)
{ var f = { arg s1
          ; var rate = ExpRand.ir(0.1, 2).dup
          ; var n1 = { LFNoise1.kr(rate).exprange(0.01, 10) }
          ; var n2 = { LFNoise1.kr(rate).exprange(10, 50) }
          ; var n3 = LFNoise1.kr(rate).exprange(2, 10)
          ; var f1 = (0.6.coin).if({ n1.value }, { n2.value })
          ; var s2 = [1 - s1, s1.reverse].choose
          ; var f2 = LinExp.kr(s1, -1, 1, f1, f1 * n3)
          ; var u1 = LFSaw.kr(f2, 0)
          ; var u2 = LFSaw.kr(f1 * 0.1, 0, 0.1, 1)
          ; var u3 = (0.5.coin).if({ u1 * s2 }, { u1 * u2 })
          ; u3.clip2(1) }
; var g = { arg func, n
          ; n.do({ func = func <> func })
          ; func }
; var inp = LFSaw.kr(0.2 * [1, 1.1], 0)
; var b_freq = [70, 800, 9000, 5242]
; var ff = g.value(f, 4).value(inp)
; var c_saw = Saw.ar(ff.exprange(6, 11000)).product
; var b_saw = BPF.ar(c_saw, b_freq, 0.2).sum.dup
; b_saw * 0.3 }
