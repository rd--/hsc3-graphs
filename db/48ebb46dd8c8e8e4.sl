var d = MouseY(0.00001, 0.01, 1, 0.2);
var k = MouseX(0.1, 20, 1, 0.2);
var inforce = K2A(MouseButton(0, 1, 0)) > 0;
var m0 = Spring(inforce, k, 0.01);
var m1 = Spring(m0, 0.5 * k, d);
var m2 = Spring(m0, 0.6 * k + 0.2, d);
var m3 = Spring(m1 - m2, 0.4, d);
SinOsc(m3 * 200 + 500, 0) * 0.1
