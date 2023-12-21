// https://sccode.org/1-4Qy ; f0 ; 0343
var b = 0.01 / 2.to(6);
var c = SinOscFB.ar(1 - b * 8, 1 / 2) + 1 / 2;
var e = Decay.ar(c > 0.99512 * SinOscFB.ar(c + 1 / b, 0), 1 / 2) / 22;
var o = SinOscFB.ar(4 ** SinOscFB.ar(b, 0) * 99, c);
Splay2.ar((o * e).tanh)

// ---- tweet0343
a=SinOscFB;Splay ar:a.ar(4**a.ar(b=0.01/(2..6))*99,c=a.ar(1-b*8,1/2)+1/2,Decay.ar(c>0.99512*a.ar(c+1/b),1/2)/22).tanh
