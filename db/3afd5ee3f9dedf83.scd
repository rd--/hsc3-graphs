// MiPlaits ; filtered noise
{var harm = 0.575;
 var timbre = 0.02;
 var morph = LFNoise1.kr(0.3).range(0.55,0.9); // filter resonance
 MiPlaits.ar(62, 9, harm, timbre, morph) * 0.25}
