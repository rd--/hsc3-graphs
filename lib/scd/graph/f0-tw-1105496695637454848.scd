// f0 ; https://twitter.com/redFrik/status/1105496695637454848
{var b = 15.iota + 1 / 151
;var w = VarSaw.kr(freq: b, iphase: b, width: 1 / 5.15, mul: 1, add: 1.5).ceil
;var s = Select.kr(which: VarSaw.kr(freq: 1/15, iphase: 1/5, width: b, mul: 5).ceil + 5 / 5, array: [51 * 1.5, 51, 151])
;var x = Lag.kr(in: s, lagTime: b)
;var y = VarSaw.kr(freq: 5 + b, iphase: 0, width: 0.5)
;var z = VarSaw.kr(freq: b, iphase: b, width: b, mul: b / 5, add: [1.5, 5, 1])
;var m = VarSaw.kr(freq: 5 - b, iphase: b, width: b, mul: 5, add: 5)
;var o = VarSaw.ar(freq: w * x + y * z, iphase: b, width: VarSaw.kr(freq: b, iphase: 0, width: 0.5) + 5 / 15, mul: m > 1.515)
;var f = 1515 ** (VarSaw.kr(freq: 1-b/5, iphase: 0, width: 0.5) / 15 + 1 + b)
;var rq = 1.5 ** VarSaw.kr(freq: b, iphase: 0, width: 0.5) / 5
;Splay.ar(inArray: BLowPass.ar(in: o, freq: f, rq: rq) / 5)}

//---- f0 ; https://twitter.com/redFrik/status/1105496695637454848
{a=VarSaw;Splay ar:ar(BLowPass,ar(a,kr(a,b=(1..15)/151,b,1/5.15,1,1.5).ceil*kr(Select,kr(a,1/15,1/5,b,5).ceil+5/5,[51*1.5,51,151]).lag(b)+kr(a,5+b)*kr(a,b,b,b,b/5,[1.5,5,1]),b,kr(a,b)+5/15,kr(a,5-b,b,b,5,5)>1.515),1515**(kr(a,1-b/5)/15+1+b),1.5**kr(a,b)/5)/5}

//---- calculations
1.series(nil,15) == 15.iota(1)