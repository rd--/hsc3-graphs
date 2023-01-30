// 20061023 ; rd
var n1 = LFNoise0.kr([0.5, 1.5]);
var o = SinOsc.kr(n1, 0);
var a = Slope.kr(o).abs * [2, 3];
var t = Impulse.ar(a, 0);
var i = Decay2.ar(t, 0.1, 0.2);
var x = MouseX.kr(960, 3620, 1, 0.2);
var y = MouseY.kr(0.5, 2.0, 0, 0.2);
var n2 = TRand.ar(x, 3940, t);
var n3 = TRand.ar(0.005, 0.275, t);
Ringz.ar(i, n2, n3 * y)
