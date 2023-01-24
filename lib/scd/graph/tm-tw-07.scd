// sc-140 ; 07 ; Thor Magnusson
var a = LFNoise0.ar(8);
SinOsc.ar(Pulse.ar(1, 0.5) * 24) +
SinOsc.ar(90 + (a * 90), 0) +
MoogFF.ar(Saw.ar(LFNoise0.ar(4) * 333 + 666), a * XLine.ar(1, 39, 99) * 99)
! 2 / 3
