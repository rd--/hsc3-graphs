// MiElements ; blow
{var mod1 = LFNoise1.kr(0.4,0.5,0.5);
 var mod2 = LFNoise1.kr(0.2,0.5,0.5);
 var pit = LFNoise0.kr(0.1).range(32,44);
 MiElements.ar(gate: 1, pit: pit, contour: 0.5, blow_level: 0.6, flow: mod1, blow_timb: mod2) * 0.2}
