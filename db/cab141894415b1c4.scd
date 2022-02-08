// <https://twitter.com/redFrik/status/1453520892374441986> f0
var b = [1, 2, 3] / 3;
var c = 2 * pi * b;
var t = SinOsc.ar(10, pi * b);
var x = SinOsc.ar(b, 0) > 0 * SinOsc.ar(b * 50, 0) + 1 / 2 * (300 ** SinOsc.ar(1 / 32, c) + 99) + (SinOsc.ar(1 / 256, c).round * 50 + 99);
var f = Latch.ar(x, t % SinOsc.ar(99 ** SinOsc.ar(1 / 64, 0), 0));
var y = SinOsc.ar(SinOsc.ar(1 / 16, 0) * 3 + 12, 0) + 1 / 2 * (SinOsc.ar(1 / 8, c) * 50 + 51);
var h = Latch.ar(y, t * SinOsc.ar(1 / 4, 0));
var o = Splay.ar(Blip.ar(f, h)) / 3 / 3;
o + GVerb.ar(o.mean / 3, 30, 3, 0.5, 0.5, 15, 1, 0.7, 0.5, 300)
