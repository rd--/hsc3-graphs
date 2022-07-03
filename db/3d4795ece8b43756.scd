// f0 <https://twitter.com/redFrik/status/1367656279926247427>
var b = #[20, 15, 18, 19, 4, 1, 7, 11, 22, -125, -188, 12, 12];
var f = { arg x, y; SinOsc.ar(x, y ? b).round };
var t = SinOsc.ar(f.value(0.01, 0) + 10, b);
var c = GrainSin.ar(1, t, 0.85, f.value(0.4, nil) + f.value(0.1, nil) + 2 ** f.value(1 / b, nil) + 1 * 99, 0, -1, 512) / 5;
var x = HPF.ar(SinOsc.ar(2, c * pi) + (PitchShift.ar(c, 0.5, f.value(1, nil) * f.value(0.1, nil) + 2, 0.05, 1) * 0.15), 5);
var y = SinOsc.ar(50, 0) * HPF.ar(f.value(1, #[0, 1]), 1) / 2;
Splay.ar(x + y).tanh
