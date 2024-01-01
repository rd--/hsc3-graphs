var a = SinOsc(800, 0);
var b = SinOsc(XLine(200, 500, 5), 0);
var c = a - b;
(c * c) * 0.125
