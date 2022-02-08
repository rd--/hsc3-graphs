// TRand
var t = Impulse.ar(7, 0) * SinOsc.ar(331, 0);
var e = Decay2.ar(t, { TRand.ar(0.01, 0.05, t) }.dup, { TRand.ar(0.05, 0.15, t) }.dup);
RLPF.ar(LFSaw.ar(TRand.ar(321, 333, t), 0), (LFNoise1.ar(2) * 4 + 100).midicps, 1) * e
