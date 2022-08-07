// https://sccode.org/1-4Qy ; f0 ; 0238
var b = [7, 6, 5, 4];
var c = LFCub.ar(b / 99) % 1 / 50;
Splay2.ar(Limiter.ar(Formlet.ar(Logistic.ar(3.9, b, 0.5), LFCub.ar(b, 0) + LFCub.ar(b / 7, 0) * 800 + 999, c, c * 2) / 9))

//--tweet0238
a=LFCub;Splay.ar(Limiter.ar(Formlet.ar(Logistic.ar(3.9,b=(7..4)),a.ar(b)+a.ar(b/7)*800+999,c=a.ar(b/99)%1/50,c*2)/9))
