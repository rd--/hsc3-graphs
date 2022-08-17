// http://earslap.com/article/sctweeting.html ; wait start
var f = LocalIn.ar(2, 0).tanh;
var k = Latch.kr(f[0].abs, Impulse.kr(0.5, 0));
LocalOut.ar(f + AllpassN.ar(Pulse.ar([2, 3], k * 0.01 + 0.000001) * 0.9, 1, k * 0.3, 100 * k));
f
