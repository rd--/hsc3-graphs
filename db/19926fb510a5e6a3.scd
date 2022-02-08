// SinOscFB
var y = MouseY.kr(1, 1000, 1, 0.2);
var x = MouseX.kr(0.5 * pi, pi, 1, 0.2);
SinOscFB.ar(100 * SinOscFB.ar(y, 0) + 200, x) * 0.1
