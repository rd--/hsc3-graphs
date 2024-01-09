// https://twitter.com/sluyterrific_sc/status/570012853274615808 (es)
var t = Dust2.ar(9 ! 2);
var o = 0.1;
var a = LFNoise2.ar(o, 9, 9);
var s = VarSaw.ar(TExpRand.ar(9, 5000, t), 0, 0.5) * Decay.ar(t, 1);
Greyhole.ar(s, a, 0, o, LFNoise2.ar(1), LFNoise2.ar(1, 1, 1), 2, a) * 0.2
