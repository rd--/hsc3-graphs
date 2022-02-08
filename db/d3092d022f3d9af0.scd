// https://twitter.com/redFrik/status/1464534258173849611 ; f0
var b = 1.to(13).asArray.rotate(3);
var n = GrayNoise.ar * SinOsc.ar(1 / b / 99, 0).max(0);
var f = 62.5 * b;
var c = f * [6, 3, 7, 5, 1, 8, 4, 2];
var x = BBandPass.ar(n, f, SinOsc.ar(0.5, 0) + SinOsc.ar(b / 999, 0) / 99 + 0.1) * (SinOsc.ar(b / 666, 0) + 2);
var y = BBandPass.ar(n, c, 9 ** SinOsc.ar(b / 333, 0) / 99) * 666 / c;
var z = BBandPass.ar(n, c / 2, 9 ** SinOsc.ar(b / 222, 0) / 99) * 888 / c;
(x + y + z * SinOsc.ar(0.001, b / 9).max(0)).splay
