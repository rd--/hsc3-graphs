// https://sccode.org/1-4Qy ; f0 ; 0318
var b = [1, 2, 3];
var o1 = SinOscFB.ar(13 * 13 * b, 1 / 3);
var o2 = SinOscFB.ar(b / 13, 1);
var o3 = SinOscFB.ar(1 / 3.to(13).reverse, 0) + 133 * b;
var o4 = SinOscFB.ar(b / 333, SinOscFB.ar(b, 1) % 1) % 1;
var o5 = SinOscFB.ar(o3, o4);
Splay.ar(o1 * o2 / 13 + o5) / 3
