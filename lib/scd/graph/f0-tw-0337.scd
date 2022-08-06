// https://sccode.org/1-4Qy ; f0 ; 0337
var b = 1.to(12) / 8;
var f1 = Formant.ar(b, b / 3.5 + 80, 999 - b / 9) + 3 * 50;
var f2 = Formant.ar(b / 3, 2.5, 5) > 0 + 1 * 300;
var f3 = Formant.ar(b / 5, 2, 3) > 0 * 1200;
Splay.ar(Formant.ar(f1, f2, f3) / 3).tanh

//--tweet0337
a=Formant;Splay.ar(a.ar(a.ar(b=(1..12)/8,b/3.5+80,999-b/9)+3*50,a.ar(b/3,2.5,5)>0+1*300,a.ar(b/5,2,3)>0*1200)/3).tanh
