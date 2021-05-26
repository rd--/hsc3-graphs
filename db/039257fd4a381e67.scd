// f0 ; https://twitter.com/redFrik/status/1395878538297892865
{var t = Impulse.ar(freq: 5, phase: 0)
;var g = [3, 2]
;var e = t.lagud(lagTimeU: 0.001, lagTimeD: SinOscFB.ar(freq: g/99, feedback: 0) + 1.08)
;var m = ([24,0,3,5,7,10,36] +.t [36,48,36,33,60,72]).flat
;var f = Demand.ar(trig: t, reset: 0, demandUGens: Dseq.new(list: m.midicps, repeats: inf) / g)
;var o = SinOscFB.ar(freq: f, feedback: SinOscFB.ar(freq: 0.02, feedback: 0), mul: e)
;var p = 3 ** SinOscFB.ar(freq: 0.04, feedback: 0) + e * 2000
;var c = RLPF.ar(in: o, freq: p, rq: 3 ** SinOscFB.ar(freq: g/9, feedback: 0) / 3, mul: 4)
;var z = CombN.ar(in: [c.tanh, c], maxdelaytime: 1, delaytime: [1/2, 1/3], decaytime: [4, 5]).sum
;(z / 8 + c).tanh * 0.1}
