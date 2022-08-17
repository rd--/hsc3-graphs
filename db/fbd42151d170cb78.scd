// MiPlaits ; something...
var trigger = Dust.kr(LFNoise2.kr(0.1).range(0.1,7));
var harmonics = SinOsc.kr(0.03, 0).range(0.0,1.0);
var timbre = LFTri.kr(0.07, 0).range(0.0,1.0);
var morph = LFTri.kr(0.11, 0).range(0.0,1.0).squared;
var pitch = TIRand.kr(24, 48, trigger);
var engine = TRand.kr(0, 15, trig: trigger).round;
var sub = SinOsc.ar(pitch.midicps, 0, 0.1);
var mi = MiPlaits.ar( pitch, engine, harmonics, timbre, morph, trigger: trigger, decay: 0.8, lpg_colour: 0.2, mul: 0.5);
(mi + sub) * 0.2
