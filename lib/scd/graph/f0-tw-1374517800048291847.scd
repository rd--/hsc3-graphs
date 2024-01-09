// f0  https://twitter.com/redFrik/status/1374517800048291847
var b = 9.iota + 1;
var f0 = Lag.ar(VarSaw.ar(0.003, b / 9, 0.5).round(1 / 3), 1.9) * 91 + 252;
var w0 = VarSaw.ar(b / 9 / 99, 0, 0.5) % 1;
var f1 = 63 * b + VarSaw.ar(0.49, b / 9, 0.5);
var f2 = VarSaw.ar(b / 9 / 9, 0, b / 10) / 99 + f0 * b;
var w1 = VarSaw.ar(f2, 0, b / 9) + 1 / 2;
var m1 = VarSaw.ar(6, b / 9 / 3, 0).max(VarSaw.ar(0.2, b / 9, 0.5) / 9 + (VarSaw.ar(0.009, 0, 0.5) * 0.3 + 0.4));
var o2 = VarSaw.ar(f1, 0, w1) * m1 + (VarSaw.ar(60, 0, 0.5) * VarSaw.ar(3, 0, 0).max(0) ** 3);
Splay.ar(VarSaw.ar(f0, b / 9, w0) / 3 + o2 / 5)

// ---- https://twitter.com/redFrik/status/1374517800048291847
{b=(1..9);ar(Splay,ar(a=VarSaw,63*b+ar(a,0.49,c=b/9),0,ar(a,(d=ar(a,3e-3,c).round(1/3).lag(1.9)*91+252)+ar(a,c/9,0,b/(9+1),1/99)*b,0,c)+1/2,ar(a,6,c/3,0).max(ar(a,0.2,c)/9+(ar(a,9e-3)*0.3+0.4)))+ar(a,60,0,0.5,ar(a,3,0,0).max**3)+ar(a,d,c,ar(a,c/99)%1,1/3)/5)}

// ---- calculations
(1..9) == (9.iota + 1)
