// MiPlaits ; some FM
var harm = MouseX.kr(0, 1);
var timbre = MouseY.kr(0,1);
var morph = LFNoise2.kr(0.2).range(0,1);
var trigger = Impulse.ar(8);
MiPlaits.ar(48, 2, harm,  timbre, morph, trigger, decay: 0.5) * 0.1
