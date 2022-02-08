// f0 ; https://twitter.com/redFrik/status/1210118661022867458
{var b = (6.iota + 2).reciprocal
;var d = $0.ascii.reciprocal
;var g = 0.cos.cos
;var f = Duty.ar(dur: b, reset: 0, level: Dseq.dr(list: "0 0 00 0 0 000  _0 0 0 00 00 00000+  !".ascii, repeats: inf), doneAction: 0)
;var o = SinOscFB.ar(freq: f, feedback: SinOsc.ar(freq: d, phase: 0).max(0) * 0.cos.sin)
;var c = SinOsc.ar(freq: 0, phase: pi ** o)
;var p = PitchShift.ar(in: c, windowSize: g, pitchRatio: b.reciprocal, pitchDispersion: d, timeDispersion: d, mul: b)
;LeakDC.ar(in: Splay.ar(inArray: c + p), coef: 0.995) * g}
