// https://sccode.org/1-4Qy ; f0 ; 0283
var b = 1 / 2.to(6);
var o1 = SinOscFB.ar(SinOscFB.ar(b, 1) < b * 500 + 99, 0) / 5;
var o2 = SinOscFB.ar(999 * b, SinOscFB.ar(SinOscFB.ar(b, 1) < 0.1 + 1, 1) % b);
var o3 = SinOscFB.ar(0.1 - b, 1).min(0);
Splay2.ar(o1 + (o2 * o3)) / 2

//----tweet0283
a=SinOscFB;Splay.ar(a.ar(a.ar(b=1/(2..6),1)<b*500+99)/5+a.ar(999*b,a.ar(a.ar(b,1)<0.1+1,1)%b,a.ar(0.1-b,1).min(0)))/2
