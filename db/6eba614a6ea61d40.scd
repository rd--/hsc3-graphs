// https://sccode.org/1-4Qy ; f0 ; 0298
var c =SinOscFB.ar([2, 3], 0) % 1;
var f = XFade2.ar(SinOscFB.ar(1, 0).ceil * 36, SinOscFB.ar(2, 0).rounded * 2 + 4 * 12, SinOscFB.ar(1 / [4, 12]), 1) + 8 * 4;
SinOscFB.ar(f, c) * c * SinOscFB.ar(1, 1/3)
