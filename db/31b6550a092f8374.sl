;; Vibrato
var x = MouseX(2, 100, 0, 0.2);
var y = MouseY(0, 1, 0, 0.2);
var v = Vibrato(Dc(400), x, 0.1, 1, 1, y, 0.1, 0, 0);
SinOsc(v, 0) * 0.1
