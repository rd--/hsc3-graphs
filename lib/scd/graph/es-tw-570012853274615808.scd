// https://twitter.com/sluyterrific_sc/status/570012853274615808 (es)
var t = Dust2.ar(9 ! 2);
var o = 0.1;
var a = LFNoise2.ar(o, 9, 9);
var s = VarSaw.ar(TExpRand.ar(9, 5000, t), 0, 0.5) * Decay.ar(t, 1);
Greyhole.ar(s, a, 0, o, LFNoise2.ar(1), LFNoise2.ar(1, 1, 1), 2, a) * 0.2

// ---- https://twitter.com/sluyterrific_sc/status/570012853274615808 (es) ; requires=keywords
var t = Dust2.ar(density: 9!2);
var o = 0.1;
var a = LFNoise2.ar(freq: o, mul: 9, add: 9);
var s = VarSaw.ar(freq: TExpRand.ar(lo: 9, hi: 5000, trig: t), iphase: 0, width: 0.5) * Decay.ar(in: t, decayTime: 1);
Greyhole.ar(in: s, delayTime: a, damp: 0, size: o, diff: LFNoise2.ar(freq: 1), feedback: LFNoise2.ar(freq: 1, mul: 1, add: 1), modDepth: 2, modFreq: a) * 0.2
