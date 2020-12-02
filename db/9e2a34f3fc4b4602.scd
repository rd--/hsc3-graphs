// MiPlaits ; some chords + trigger + level
{var harm = MouseY.kr(0,1);  // select chord
 var timbre = 0.5;
 var morph = 0.5;
 var trigger = Impulse.kr(6);
 var lev = TRand.kr(trig: trigger);
 MiPlaits.ar(40, 6, harm, timbre, morph, trigger, lev.squared, decay: 0.5, timb_mod: 0.4, mul: 0.1)[0]}
