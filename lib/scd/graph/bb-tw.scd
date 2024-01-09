// http://earslap.com/article/sctweeting.html
var a = LocalIn.ar(1, 0);
var x = SinOsc.ar((Decay.ar(Impulse.ar([4, 4.005], 0), 1000 * a.abs) * 50), a).distort;
x <! LocalOut.ar(Mix.ar(x))

// http://earslap.com/article/sctweeting.html ; wait start
var f = LocalIn.ar(2, 0).tanh;
var k = Latch.kr(f[0].abs, Impulse.kr(0.5, 0));
f <! LocalOut.ar(f + AllpassN.ar(Pulse.ar([2, 3], k * 0.01 + 0.000001) * 0.9, 1, k * 0.3, 100 * k))

// http://earslap.com/article/sctweeting.html
var f = LocalIn.ar(2, 0).tanh;
var k = Latch.kr(f[0].abs, Impulse.kr(1 / 4, 0));
f <! LocalOut.ar(f + CombC.ar(Blip.ar([4, 6], 100 * k + 50) * 0.9, 1, k * 0.3, 50 * f))

// http://earslap.com/article/sctweeting.html
var f = {
	var a = LFNoise1.ar(Rand.ir(0, 0.2));
	DelayC.ar(BPF.ar(WhiteNoise.ar * Dust2.ar(a * a * 4 ** 2).lag(0.008), IRand.ir(0, 10000) + 300, 0.09), 3, a * 1.5 + 1.5) * 45
};
Mix(f.dup(80)).dup

// http://earslap.com/article/sctweeting.html
AllpassC.ar(SinOsc.ar(55, 0).tanh, 0.4, TExpRand.ar(0.0002, 0.4, Impulse.ar(8, 0)).roundTo([0.002,0.0004]), 2)
