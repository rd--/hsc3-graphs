// https://sccode.org/1-4Qy ; f0 ; 0278
var b = 1 / 2 ** (2 .. 6);
var o = LFSaw.ar(LFSaw.ar(b, 0) > 0 * 3 + 15 / b, 0);
var f = pi ** LFSaw.ar(LFSaw.ar(b, 0) + 1 * b) * 999 + (LFSaw.ar(LFSaw.ar(b * 9, 0) * 9, 0) * 99) / 2;
Splay.ar(RLPF.ar(o, f, 0.2)) / 5
