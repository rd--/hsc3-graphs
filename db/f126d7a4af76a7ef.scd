// https://sonomu.club/@lukiss/110533029814503247
var p = (1, 2 .. 14).degreeToKey([0, 2, 4, 7, 9], 12).midiratio;
var f = SinOsc.ar(p.sin * 8, 0) * 0.005 + 1 * p * 52;
var h = SinOsc.ar(f * 2, 0) * SinOsc.ar(1 / 4 / p, 0) * SinOsc.ar(pi / p, 0).linexp(-1, 1, 0.01, 1) * 8 * pi;
var m = LFSaw.ar(-1 * [7, 3.5, 7 / 10] * (SinOsc.ar(f.sin.linexp(-1, 1, 0.01, 1), 0) * 0.001 + 1), 1) * 0.5 + 0.5;
var e = m ** (SinOsc.ar(8 / p / f.atan, 0) * 30 + 32);
var o = SinOsc.ar(f, h) * e;
Splay.ar(0.5 * o, SinOsc.ar(pi, 0))
