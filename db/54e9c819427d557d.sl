;; quad ; eye ; jmcc
var m = MouseX(0.5, 1, 0, 0.2);
var a = LfPulse(200, 0, 0.3) * 0.05;
var b = OnePole(a, m);
var c = OnePole(b, m);
var d = OnePole(c, m);
var e = OnePole(d, m);
[b, c, d, e]