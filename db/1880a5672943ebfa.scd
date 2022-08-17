// MiPlaits ; snare drums
var harm = LFNoise2.kr(0.5).range(0,0.5);
var timbre = 0.173;
var morph = 0.827;
var trigger = Impulse.kr(8);
var lev = TRand.kr(trig: trigger).squared;
MiPlaits.ar(47, 14, harm, timbre, morph, trigger, lev, fm_mod: 0.2, timb_mod: 0.43, decay: 0.4) * 0.1
