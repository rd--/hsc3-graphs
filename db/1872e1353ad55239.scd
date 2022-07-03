// VOSIM
var p = TRand.ar(0, 1, Impulse.ar(6, 0));
var t = Impulse.ar(9 * (1 + (p > 0.95)));
var f = TRand.ar([40, 120, 220], [440, 990, 880], t);
var n = TRand.ar(4, [8, 16, 32], t);
var d = TRand.ar([0.2, 0.4, 0.6], [0.6, 0.8, 1], t);
var a = TRand.ar(0, [0.2, 0.6, 1], t);
var l = TRand.ar(-1, 1, t);
var x = MouseX.kr(0.25, 2, 0, 0.2);
var y = MouseY.kr(0.25, 0.85, 0, 0.2);
var z = 9;
var freq = f * x * LinLin.kr(LFNoise2.kr(z), -1, 1, 0.25, 2);
var decay = d * y * LinLin.kr(LFNoise2.kr(z), -1, 1, 0.25, 2);
Pan2.ar((VOSIM.ar(t, freq, n, decay) * a).sum, l, 0.75)
