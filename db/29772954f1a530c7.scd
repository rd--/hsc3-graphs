// SinOscFB
var y = MouseY.kr(10, 1000, 1, 0.2);
var x = MouseX.kr(0.5 * pi, pi, 1, 0.2);
SinOscFB.ar(y, x) * 0.1
