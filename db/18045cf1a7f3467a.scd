// https://sccode.org/1-4Qy ; f0 ; 0321
var b = (1 .. 6) * 60;
var c = SinOsc.ar(b, LocalIn.ar(6, 0) * 3);
var o = Limiter.ar(BPF.ar(c, SinOsc.ar(16 / b, 0) + 3 * b, 1), 0.66, 16 / b);
Splay2.ar(c / 2) <! LocalOut.ar(o)