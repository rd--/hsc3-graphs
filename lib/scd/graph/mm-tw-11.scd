// sc-140 ; 11 ; Micromoog
var f0 = [[1, 2, 3, 4], [1, 2, 3, 4]];
var f1 = Hasher.ar(Latch.ar(SinOsc.ar(f0, 0),Impulse.ar([5/2, 5], 0))) * 300 + 300;
VarSaw.ar(f1.roundTo(60), 0) * (LFNoise2.ar(2) * (1 / 3) + 0.5) / 5
