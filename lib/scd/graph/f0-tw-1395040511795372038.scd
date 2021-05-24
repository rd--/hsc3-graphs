// f0 ; https://twitter.com/redFrik/status/1395040511795372038
{var b = [2,6,3,1]
;var c = 500
;var l = Dseq.new(list: (SinOscFB.ar(freq: b / 24, feedback: 0).round + (0..9) * 7 + 29.17).midicps, repeats: inf)
;var f = Duty.ar(dur: b, reset: SinOscFB.ar(freq: b / 9, feedback: 0), level: l)
;var o = SinOscFB.ar(freq: f, feedback: SinOscFB.ar(freq: b / 13, feedback: 0).max / 3 * 2)
;var p = AllpassN.ar(in: o / 8, maxdelaytime: 1, delaytime: 0.51, decaytime: 8)
;var m = SinOscFB.ar(freq: b / c, feedback: 0).max / c
;var h = Hasher.ar(in: SinOscFB.ar(freq: b / 12, feedback: 0).max, mul: m)
;var q = BPF.ar(in: h, freq: 2 ** SinOscFB.ar(freq: b / c * 2, feedback: 0) * 10000, rq: 1 / 99)
;HPF.ar(in: p + GVerb.ar(in: q, roomsize: 99, revtime: 9, damping: 0.2), freq: 50).clump(2) * 0.2}

// f0 ; https://twitter.com/redFrik/status/1395040511795372038
{var b = [2,6,3,1]
;var c = 500
;var f = Duty.ar(b,SinOscFB.ar(b/9),Dseq.new((SinOscFB.ar(b/24).round+(0..9)*7+29.17).midicps,inf))
;var o = SinOscFB.ar(f,SinOscFB.ar(b/13).max/3*2)
;var p = AllpassN.ar(o/8,1,0.51,8)
;var q = BPF.ar(Hasher.ar(SinOscFB.ar(b/12).max,SinOscFB.ar(b/c).max/c),2**SinOscFB.ar(b/c*2)*1e4,1/99)
;HPF.ar(p+GVerb.ar(q,99,9,0.2),50).clump(2) * 0.2}

// f0 ; https://twitter.com/redFrik/status/1395040511795372038
{clump(ar(HPF,ar(AllpassN,ar(a=SinOscFB,ar(Duty,b=[2,6,3,1],ar(a,b/9),Dseq((ar(a,b/24).round+(0..9)*7+29.17).midicps,inf)),ar(a,b/13).max/3*2)/8,1,0.51,8)+ar(GVerb,ar(BPF,ar(Hasher,ar(a,b/12).max,ar(a,b/c=500).max/c),2**ar(a,b/c*2)*1e4,1/99),99,9,0.2),50),2) * 0.2}
