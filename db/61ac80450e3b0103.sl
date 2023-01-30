;; Sine ; mouse control
var f = MouseX(0.25, 8, 0, 0.2);
var a = MouseY(0.05, 0.1, 0, 0.2);
var t = Impulse(f, 0);
SinOsc(TRand(220, 440, t), 0) * Sine(t, 1 / f) * a
