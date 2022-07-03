// Formlet
var i = Impulse.ar(LFNoise2.kr([0.15, 0.6]) * 15 + 15, 0.5);
Formlet.ar(i, TRand.ar(30, [150, 600], i), TRand.ar(0.01, [0.15, 0.6], i), TRand.ar(0.05, [0.15, 0.6], i)) * 0.25
