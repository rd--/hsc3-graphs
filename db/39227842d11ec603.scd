// MiPlaits ; modal resonator + trigger
{var harm = LFNoise2.kr(0.2).range(0,1);
 var timbre = 0.0;
 var morph = 0.85;
 var trigger = Impulse.kr(1);
 var lev = TRand.kr(trig: trigger).squared;
 Mix.ar(MiPlaits.ar(56, 12, harm, timbre, morph, trigger, lev))}
