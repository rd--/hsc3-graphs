// f0 ; https://twitter.com/redFrik/status/1395040511795372038
{var b = [2,6,3,1]
;var c = 500
;var l = Dseq.new(list: (SinOscFB.ar(freq: b / 24, feedback: 0).round + 10.iota * 7 + 29.17).midicps, repeats: inf)
;var f = Duty.ar(dur: b, reset: SinOscFB.ar(freq: b / 9, feedback: 0), level: l, doneAction: 0)
;var o = SinOscFB.ar(freq: f, feedback: SinOscFB.ar(freq: b / 13, feedback: 0).max(0) / 3 * 2)
;var p = AllpassN.ar(in: o / 8, maxdelaytime: 1, delaytime: 0.51, decaytime: 8)
;var m = SinOscFB.ar(freq: b / c, feedback: 0).max(0) / c
;var h = Hasher.ar(in: SinOscFB.ar(freq: b / 12, feedback: 0).max(0), mul: m)
;var q = BPF.ar(in: h, freq: 2 ** SinOscFB.ar(freq: b / c * 2, feedback: 0) * 10000, rq: 1 / 99)
;HPF.ar(in: p + GVerb.ar(in: q, roomsize: 99, revtime: 9, damping: 0.2), freq: 50).clump(2) * 0.2}
