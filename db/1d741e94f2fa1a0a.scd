// MiPlaits ; scanning through some engines + vibrato
var pit = 50;
var vib = SinOsc.ar(6, 0, 0.3);
var e = LFNoise0.kr(0.5, 4, 4);
MiPlaits.ar(pit+vib, e, mul: 0.1)
