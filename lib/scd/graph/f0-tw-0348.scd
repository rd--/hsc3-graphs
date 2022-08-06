// https://sccode.org/1-4Qy ; f0 ; 0348
var b = [9, 4, 3, 6] / 4;
var c = VarSaw.ar(0.1 / b) + 1 / 9;
var o = 9 ** c * VarSaw.ar((VarSaw.ar(c / 3, 0, 0.5) + b).roundTo(b) * 99, 0, c);
Splay2.ar(AllpassC.ar(o, 1, c + 9 / 99, 9).tanh) / 2

//----tweet0348
a=VarSaw;Splay ar:AllpassC.ar(9**(c=a.ar(0.1/b=[9,4,3,6]/4)+1/9)*a.ar(round(a.ar(c/3)+b,b)*99,0,c),1,c+9/99,9).tanh/2
