// https://sccode.org/1-4Qy ; f0 ; 0281
var b = 2 / 2.to(9);
var p = LFCub.ar(b, 0) % LFCub.ar(b / 5, 0);
var q = LFCub.ar(2 ** LFCub.ar(b / 8, 0) > 0 + 1 * 2 * (b * [300,303] - Lag2(LFCub.ar(b / 9, 0) > 0 * 50, 0.1)));
var r = LFCub.ar(b / 6, b);
Splay.ar(p * q * r)
