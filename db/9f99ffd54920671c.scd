// MiPlaits ; wavetable + trigger
{var trigger = Impulse.kr(8);
 var harm = LFNoise2.kr(0.3,0.25,0.25);
 var timbre = LFNoise1.kr(0.4,0.5,0.5);
 var dec = LFNoise2.kr(0.2).range(0.01,0.8);
 MiPlaits.ar(44, 5, harm, timbre, 0, trigger, decay: dec, mul: 0.2)}
