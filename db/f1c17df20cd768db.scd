// https://twitter.com/redFrik/status/839296011982024704
{var t = LFSaw.ar(freq: [0.5,0.6], iphase: 0)
;var f = LFSaw.ar(freq: 5, iphase: 0) * LFSaw.ar(freq: 0.015, iphase: 0) + 1 * 98
;var m = (2 ** LFSaw.ar(freq: 4, iphase: 0)).round(0.5) * 99
;var i = 2 ** LFSaw.ar(freq: 1 / [8,9], iphase: 0) * 8
;var g = GrainFM.ar(numChannels: 1, trigger: t, dur: 16, carfreq: f, modfreq: m, index: i, pan: 0, envbufnum: -1, maxGrains: 512)
;(g/2).tanh * 0.25}
