// https://sccode.org/1-4Qy ; f0 ; 0308
var b = (1 .. 9);
var o = Blip.ar(Blip.ar(Blip.ar(2.01, 3) > 0, b) + 1, b / 8) + 2 * 99;
var a = Splay.ar(Formlet.ar(o, b * 50, 0.01, 1).tanh);
FreqShift.ar(a, 0.01, 0) + a / 7
