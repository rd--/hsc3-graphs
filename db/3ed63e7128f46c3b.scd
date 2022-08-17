// MiPlaits ; inharmonic string
var harm = LFNoise2.kr(0.2).range(0,1);
var timbre = 0.0;
var morph = 0.85;
MiPlaits.ar(60, 11, harm, timbre, morph)
