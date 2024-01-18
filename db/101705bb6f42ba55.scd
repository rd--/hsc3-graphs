// https://sccode.org/1-4Qy ; f0 ; 0342
var b = (1 .. 8) / 128;
var c = LFSaw.ar(b, 0) % 1;
var f = (2 ** LFSaw.ar(b, 0) * 256).round(64);
var e = RLPF.ar(LFSaw.ar(1 / b / 32, 0), 500, 1.01 - c);
var o = SinOscFB.ar(f, c) * e;
Splay.ar(Clip.ar(o, 0, 1) / 2)
