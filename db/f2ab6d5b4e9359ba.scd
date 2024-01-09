// f0 ; https://twitter.com/redFrik/status/1374517800048291847
{var b = 9.iota + 1
;var f0 = Lag.ar(in: VarSaw.ar(freq: 0.003, iphase: b / 9, width: 0.5).round(1/3), lagTime: 1.9, mul: 91, add: 252)
;var w0 = VarSaw.ar(freq: b / 9 / 99, iphase: 0, width: 0.5) % 1
;var f1 = 63 * b + VarSaw.ar(freq: 0.49, iphase: b / 9, width: 0.5)
;var w1 = VarSaw.ar(freq: VarSaw.ar(freq: b / 9 / 9, iphase: 0, width: b / 10, mul: 1/99, add: Lag.ar(in: VarSaw.ar(freq: 0.003, iphase: b / 9, width: 0.5).round(1/3), lagTime: 1.9, mul: 91, add: 252)) * b, iphase: 0, width: b / 9) + 1 / 2
;Splay.ar(VarSaw.ar(freq: f0, iphase: b / 9, width: w0, mul: 1/3, add: VarSaw.ar(freq: f1, iphase: 0, width: w1, mul: VarSaw.ar(freq: 6, iphase: b / 9 / 3, width: 0).max(VarSaw.ar(freq: 0.2, iphase: b / 9, width: 0.5) / 9 + VarSaw.ar(freq: 0.009, iphase: 0, width: 0.5, mul: 0.3, add: 0.4)), add: VarSaw.ar(freq: 60, iphase: 0, width: 0.5) * VarSaw.ar(freq: 3, iphase: 0, width: 0).max(0) ** 3)) / 5)}
