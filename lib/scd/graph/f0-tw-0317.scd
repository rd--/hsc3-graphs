// https://sccode.org/1-4Qy ; f0 ; 0317
var b = [0, 3, 7, 5, 2, 9, 10] + 0.2;
var c = VarSaw.ar(0.5 / b, 0, 0.5);
var m = Select.ar(VarSaw.ar(2.01 / b, 0, 0.5) * 8, c > 0 * 12 + b + 48);
Splay.ar(VarSaw.ar(m.midicps, 0, c % 1).tanh) / 2

//----tweet0317
a=VarSaw;Splay ar:a.ar(Select.ar(a.ar(2.01/b=[0,3,7,5,2,9,10]+0.2)*8,(c=a.ar(0.5/b))>0*12+b+48).midicps,0,c%1).tanh/2
