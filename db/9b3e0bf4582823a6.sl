;; http://sccode.org/1-Z (jl) ; requires=kr
var a = Lag(Impulse(8, 0), 0.1).kr;
var b = Crackle(Lag(LfSaw(3, 0).Abs, 0.1).kr * 1.8);
var c = a * b;
var d = Lag(Impulse(2, 0) + Impulse(4, 0.5), 0.1).kr;
var e = Blip(4.9, 7) * 0.4;
var f = d * e;
(c + GVerb(f, 1, 1, 0.5, 0.5, 15, 1, 0.7, 0.5, 300) * 5).Tanh * 0.25
