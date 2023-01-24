// sc-140 ; 11 ; Micromoog
var f = Hasher.ar(Latch.ar(SinOsc.ar((1 .. 4) ! 2, 0),Impulse.ar([5/2, 5], 0))) * 300 + 300;
VarSaw.ar(f.roundTo(60), 0, LFNoise2.ar(2) / 3 + 0.5) / 5
