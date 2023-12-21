// https://sccode.org/1-4Qy ; f0 ; 0288
var b = 1.to(4);
var c = b + 8;
var f = SelectX.ar(SinOscFB.ar(0.1, 0) % (SinOscFB.ar(b, 0)) * c, DC.ar(':.UODD.Ed'.ascii.midiCps), 1);
Splay2.ar(SinOscFB.ar(f, SinOscFB.ar(1 / c, 0))) / 2

// ---- tweet0288
a=SinOscFB;Splay.ar(a.ar(SelectX.ar(a.ar(0.1)%(a.ar(b=(1..4)))*(c=b+8),DC ar:':.UODD.Ed'.ascii.midicps),a.ar(1/c)))/2
