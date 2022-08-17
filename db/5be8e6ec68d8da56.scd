// quad ; eye ; jmcc
var m = MouseX.kr(0.5, 1, 0, 0.2);
var a = LFPulse.ar(200, 0, 0.3) * 0.05;
var b = OnePole.ar(a, m);
var c = OnePole.ar(b, m);
var d = OnePole.ar(c, m);
var e = OnePole.ar(d, m);
[b, c, d, e]
