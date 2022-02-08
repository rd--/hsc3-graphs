// <https://twitter.com/redFrik/status/1452954849885163525> f0
var i = Rand.ir(1, 64);
var x = (SinOsc.kr(i % 9.33, 0) * 5 + 5).ceil;
var t = SinOsc.ar(2 ** (i % 11) * 150 / x, 0);
var y = Changed.kr(x, 0);
var f = t.exprange(Latch.kr(SinOsc.kr(i % 4.4, 0).exprange(9, 999), y), Latch.kr(SinOsc.kr(i % pi, 0).exprange(99, 9000), y));
Pan2.ar(Blip.ar(f, t + 2) * (1 - t), SinOsc.kr(0.1, i), Line.kr(0.2, 0, 9).min(0.6) ** 2)
