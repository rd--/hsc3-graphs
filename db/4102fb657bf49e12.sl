var inforce = K2A(MouseButton(0, 1, 0)) > 0;
var k = MouseY(0.1, 20, 1, 0.2);
var d = MouseX(0.00001, 0.1, 1, 0.2);
var outforce = Spring(inforce, k, d);
var freq = outforce * 400 + 500;
SinOsc(freq, 0) * 0.2
