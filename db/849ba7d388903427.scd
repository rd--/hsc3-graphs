// https://sccode.org/1-4Qy ; f0 ; 0288
var b = (1 .. 4);
var c = b + 8;
var f = SelectX.ar(SinOscFB.ar(0.1, 0) % (SinOscFB.ar(b, 0)) * c, DC.ar(':.UODD.Ed'.ascii.midicps), 1);
Splay.ar(SinOscFB.ar(f, SinOscFB.ar(1 / c, 0))) / 2
