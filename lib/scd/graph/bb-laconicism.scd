// http://earslap.com/weblog/music-release-laconicism.html
var k = Duty.ar(6.4, 0, Dseq.dr([0.05, Drand.dr([0.04, 0.08], 1)], inf));
Splay.ar(Integrator.ar((LFNoise0.ar(5.dup(3)) * k).round(k / 10), 1).sin.sqrt.tanh, 0.3, 1, 0, true)

// http://earslap.com/weblog/music-release-laconicism.html ; wait
var x = LFNoise1.ar(0.5 * LocalIn.ar(1, 0) + 0.1) * 0.5 + 0.5;
PitchShift.ar(
	PitchShift.ar(
		Pulse.ar([90, 90.01], x),
		10,
		x * 4,
		x,
		0
	),
	10,
	4 - (x * 4),
	1 - x,
	0
) <! LocalOut.ar(x)

// http://earslap.com/weblog/music-release-laconicism.html ; wait
var q = [0, 3, 5, 7, 10];
var t = Impulse.kr(4, 0) * LFNoise0.kr(500) > 0;
var f = Demand.kr(t, 0, Drand.dr((q + 12 ++ q + 33).midicps, inf));
PitchShift.ar(Saw.ar(f) * Decay.kr(t, 3), 7, 2, 0, 0).dup(2)

// http://earslap.com/weblog/music-release-laconicism.html
var snd = HPF.ar(Pulse.ar([[0.1, 0.11], [0.12, 0.13]], 0.6) * 0.005, 99);
Mix(HPF.ar(MidEQ.ar(Limiter.ar(GVerb.ar(snd, [[1, 5 / 4], [1.5, 2]], 99, 0.5, 0.5, 15, 1, 0,7, 0.5) * 300, 1, 0.01), 9000, 0.9, 9), 200)).flop.sum

// http://earslap.com/weblog/music-release-laconicism.html ; wait
var f = LocalIn.ar(2, 0).tanh;
var k = Latch.kr(f[0].abs, Impulse.kr(0.5, 0));
LocalOut.ar(f + AllpassN.ar(Pulse.ar([2, 3], k * 0.01 + 0.000001) * 0.9, 1, k * 0.3, 100 * k));
f

// http://earslap.com/weblog/music-release-laconicism.html
var a = BPF.ar(Saw.ar([40, 40.001]), LFNoise0.kr(128) + 1 * 4000 + 146, LFNoise1.kr(1) + 1 * 0.05 + 0.01).tanh;
CombC.ar(a, 9, a.abs.lag(2) * 9, a.abs.lag(1) * 100)

// http://earslap.com/weblog/music-release-laconicism.html
var f = LocalIn.ar(2, 0).tanh;
var k = Latch.kr(f[0].abs, Impulse.kr(1 / 4, 0));
LocalOut.ar(f + CombC.ar(Blip.ar([4, 6], 100 * k + 50) * 0.9, 1, k * 0.3, 50 * f));
f

// http://earslap.com/weblog/music-release-laconicism.html
var t = Impulse.ar(8, 0) * LFNoise1.ar(2);
CombL.ar((Saw.ar([3, 4]) * Decay.ar(t, 0.1)).tanh, 1, TRand.ar(0, 0.01, t).round(0.00015), TRand.ar(-30, 30, t))

// http://earslap.com/weblog/music-release-laconicism.html
var n = { arg freq; LFNoise0.ar(freq) };
var f = [60, 61];
var l = n.value(6);
(BBandPass.ar((n.value(4).max(l).max(SinOsc.ar(f * (l * 9).ceil.lag(0.1), 0) * 0.7)), f, n.value(1).abs / 2) * 700 * l.lag(1)).tanh

// http://earslap.com/weblog/music-release-laconicism.html
var t = [0, 0, 0, 1, 5, 7, 10, 12, 12, 12] + 30;
var a = Duty.kr(1/8, 0, Dxrand.dr(t + 24 ++ t ++ t, inf));
(BHiPass.ar(LFNoise1.ar(8) ** 6, [a, a + 7].midicps, a / 3000) * (67 - a)).tanh

// http://earslap.com/weblog/music-release-laconicism.html
AllpassL.ar(SinOsc.ar(55,0).tanh, 0.4, TExpRand.ar(0.0002, 0.4, Impulse.ar(8, 0)).round([0.002, 0.004]), 2)

// http://earslap.com/weblog/music-release-laconicism.html
var i = { arg freq; Impulse.ar(freq, 0) };
var ph = Integrator.ar(Integrator.ar(i.value(64).lag(LFNoise1.ar(2.dup(2)) * 2 + 2) * 99, 0.9), 0.99).fold2(pi);
SinOsc.ar(LagUD.ar(i.value(2), 0, 0.4) * 360, ph)

// http://earslap.com/weblog/music-release-laconicism.html
var t = [0, 3, 5, 7, 10, 12] + 40;
var p = Duty.ar(1/4, 0, Drand.dr((t + 12 ++ t).midicps, inf));
var b = TRand.ar(1500, 2000, Impulse.ar(16, 0)).lag;
Blip.ar([b, b + p], 1).mean.dup(2) ** 2

// http://earslap.com/weblog/music-release-laconicism.html
var i = Impulse.ar(8, 0).lag(0.3).dup(2);
10.do({
	i = LeakDC.ar(AllpassC.ar(i, 1, LFNoise0.ar(8).range(0.00001, 0.2), -0.15) * LFNoise0.ar(8).range(1, 3), 0.995).tanh
});
i

// http://earslap.com/weblog/music-release-laconicism.html
var n = { arg freq; LFNoise0.kr(freq) };
var v = Blip.ar([20000, 20000 - 9], 1) * (n.value(16) * 0.5 + 0.5 ** 9);
42.do({
	v = LeakDC.ar(AllpassC.ar(v, 1, n.value(5) * 0.05 + (0.05 + 0.001), 100), 0.995)
});
(v * 99).tanh

// http://earslap.com/weblog/music-release-laconicism.html
(HPF.ar(LFNoise1.ar(2), [10, 10.1]) * 100).tanh

// http://earslap.com/weblog/music-release-laconicism.html
var x = Duty.kr(1/8, 0, Drand.dr([0, Drand.dr([0.4, 0.5, 0.6, 0.7, 0.8, 0.9, 1], 1)], inf));
LeakDC.ar(BRF.ar(Saw.ar(8) * Decay2.kr(x, 0.01, 0.3) ** 1.5, x * 20 + [45.1, 45], 0.1), 0.995).tanh

// http://earslap.com/weblog/music-release-laconicism.html ; wait
var n = { arg freq, mul, add; LFNoise0.kr(freq) * mul + add };
v = Blip.ar([60, 61], 5) * (n.value(4, 1, 0) ** 8);
12.do({
	v = LeakDC.ar(CombC.ar(v, 1, n.value(1, 0.05, 0.06).lag(5000), 9))
});
Limiter.ar(v, 0.9, 1)
