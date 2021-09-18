// f0 ; https://twitter.com/redFrik/status/1374517800048291847
{var b = 9.iota + 1
;var f0 = Lag.ar(in: VarSaw.ar(freq: 0.003, iphase: b / 9, width: 0.5).round(1/3), lagTime: 1.9, mul: 91, add: 252)
;var w0 = VarSaw.ar(freq: b / 9 / 99, iphase: 0, width: 0.5) % 1
;var f1 = 63 * b + VarSaw.ar(freq: 0.49, iphase: b / 9, width: 0.5)
;var w1 = VarSaw.ar(freq: VarSaw.ar(freq: b / 9 / 9, iphase: 0, width: b / 10, mul: 1/99, add: Lag.ar(in: VarSaw.ar(freq: 0.003, iphase: b / 9, width: 0.5).round(1/3), lagTime: 1.9, mul: 91, add: 252)) * b, iphase: 0, width: b / 9) + 1 / 2
;Splay.ar(VarSaw.ar(freq: f0, iphase: b / 9, width: w0, mul: 1/3, add: VarSaw.ar(freq: f1, iphase: 0, width: w1, mul: VarSaw.ar(freq: 6, iphase: b / 9 / 3, width: 0).max(VarSaw.ar(freq: 0.2, iphase: b / 9, width: 0.5) / 9 + VarSaw.ar(freq: 0.009, iphase: 0, width: 0.5, mul: 0.3, add: 0.4)), add: VarSaw.ar(freq: 60, iphase: 0, width: 0.5) * VarSaw.ar(freq: 3, iphase: 0, width: 0).max(0) ** 3)) / 5)}

// https://twitter.com/redFrik/status/1374517800048291847
{var b = 9.iota + 1
;var a = VarSaw
;var c = b / 9
;var d = a.ar(0.003, c).round(1 / 3).lag(1.9) * 91 + 252
;var x = a.ar(63 * b + a.ar(0.49, c), 0, a.ar((d) + a.ar(c / 9, 0, b / (9 + 1), 1 / 99) * b, 0, c) + 1 / 2, a.ar(6, c / 3, 0).max(a.ar(0.2, c) / 9 + (a.ar(0.009) * 0.3 + 0.4)))
;var y = a.ar(60, 0, 0.5, a.ar(3, 0, 0).max ** 3)
;var z = a.ar(d, c, a.ar(c / 99) % 1, 1 / 3)
;Splay.ar(x + y + z / 5)}

//---- https://twitter.com/redFrik/status/1374517800048291847
{b=(1..9);ar(Splay,ar(a=VarSaw,63*b+ar(a,0.49,c=b/9),0,ar(a,(d=ar(a,3e-3,c).round(1/3).lag(1.9)*91+252)+ar(a,c/9,0,b/(9+1),1/99)*b,0,c)+1/2,ar(a,6,c/3,0).max(ar(a,0.2,c)/9+(ar(a,9e-3)*0.3+0.4)))+ar(a,60,0,0.5,ar(a,3,0,0).max**3)+ar(a,d,c,ar(a,c/99)%1,1/3)/5)}

//---- calculations
(1..9) == (9.iota + 1)
