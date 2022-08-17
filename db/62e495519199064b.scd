// Linen
var r = MouseX.kr(1/3, 10, 0, 0.2);
SinOsc.ar(440, 0) * Linen.kr(Impulse.kr(r, 0), 0, 1, 1 / r, 0)
