// http://earslap.com/weblog/music-release-laconicism.html
var f = LocalIn.ar(2, 0).tanh;
var k = Latch.kr(f.first.abs, Impulse.kr(1 / 4, 0));
LocalOut.ar(f + CombC.ar(Blip.ar([4, 6], 100 * k + 50) * 0.9, 1, k * 0.3, 50 * f));
f
