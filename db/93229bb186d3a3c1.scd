// https://sccode.org/1-4Qy ; f0 ; 0339
var b = 1 / (1 .. 12);
var f1 = 2 ** LFSaw.ar(b, 0).round(LFSaw.ar(8, b) < 0 / 4 + 1);
var f2 = 4 ** LFSaw.ar(b / 12, 0) + 2;
var f3 = 3 ** LFSaw.ar(b / 4, 0) * 3;
Splay.ar(Formant.ar(f1 * 99, f2 * 99, f3 * 99) / 2).tanh
