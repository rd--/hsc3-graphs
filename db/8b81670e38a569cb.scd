// Sine ; mouse control
var f = MouseX.kr(0.25, 8, 0, 0.2);
var a = MouseY.kr(0.05, 0.1, 0, 0.2);
var t = Impulse.kr(f, 0);
SinOsc.ar(TRand.kr(220, 440, t), 0) * Sine.kr(t, 1 / f) * a
