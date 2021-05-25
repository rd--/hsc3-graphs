// https://twitter.com/sluyterrific_sc/status/570012853274615808 (es)
{var t = Dust2.ar(density: 9!2)
;var o = 0.1
;var a = LFNoise2.ar(freq: o, mul: 9, add: 9)
;var s = VarSaw.ar(freq: TExpRand.ar(lo: 9, hi: 5000, trig: t), iphase: 0, width: 0.5) * Decay.ar(in: t, decayTime: 1)
;Greyhole.ar(in: s, delayTime: a, damp: 0, size: o, diff: LFNoise2.ar(freq: 1), feedback: LFNoise2.ar(freq: 1, mul: 1, add: 1), modDepth: 2, modFreq: a) * 0.2}
