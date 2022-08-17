// http://earslap.com/weblog/music-release-laconicism.html ; wait
var f = LocalIn.ar(2, 0).tanh;
var k = Latch.kr(f.first.abs, Impulse.kr(0.5, 0));
LocalOut.ar(f + AllpassN.ar(Pulse.ar([2, 3], k * 0.01 + 0.000001) * 0.9, 1, k * 0.3, 100 * k));
f
