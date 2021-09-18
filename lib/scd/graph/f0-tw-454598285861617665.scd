// https://twitter.com/redFrik/status/454598285861617665
{var b = 9.iota.neg + 9
;var c = LFTri.ar(freq: 3 ** LFTri.ar(freq: 1 / b, iphase: b / 9))
;var d = LFTri.ar(freq: 1 / b, iphase: 0) % 1 / 9 + 0.01
;var f = 2 ** LFTri.ar(freq: b / 99, iphase: 0).round * 99 * b
;var o = GrainSin.ar(numChannels: 2, trigger: c, dur: d, freq: f, pan: 0, envbufnum: -1, maxGrains: 512)
;Splay.ar(o.tanh) / 2}

// https://twitter.com/redFrik/status/454598285861617665
{var b = 9.series(8, 1)
;var c = LFTri.ar(3 ** LFTri.ar(1 / b,b / 9))
;var d = LFTri.ar(1 / b) % 1 / 9 + 0.01
;var f = 2 ** LFTri.ar(b / 99).round * 99 * b
;var o = GrainSin.ar(2,c,d,f)
;Splay.ar(o.tanh) / 2}

//---- calculations
(9..1) == (9.iota.neg + 9)
(9..1) == 9.series(8, 1)