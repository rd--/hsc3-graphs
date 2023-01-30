;; Formlet ; mouse control of frequency and decay time
var f = LinExp(LfNoise2([1, 3]), -1, 1, [10, 15], [400, 700]);
var s = Blip(f, 1000) * 0.1;
var x = MouseX(0.01, 0.2, 1, 0.2);
var y = MouseY([700, 1300], [2000, 100], 1, 0.2);
Formlet(s, y, 0.005, x)
