// https://sccode.org/1-4Qy ; f0 ; 0319
var b = (1 .. 8);
var c = SinOscFB.ar(b / 16 / 16.16, 0) % 1;
var f = b.collect({ |x i| [x, i + 6 / 6000 + x] }) * 60;
var e = (SinOscFB.ar([3, 6], 1) * (Lag.ar(c, 0.1) / 3)).max(0);
var o = (SinOscFB.ar(f, c) * e);
Splay.ar(o)
