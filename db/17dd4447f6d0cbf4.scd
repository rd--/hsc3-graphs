// MiElements ; metal, bells
{var trig = Dust.ar(2.5);
 var input = Decay.ar(trig, 0.01);
 var g = TBrownRand.ar(0.5, 0.9, 0.2, trig: CoinGate.ar(0.05, trig));
 var space = LFNoise1.kr(0.1).range(0.5, 1);
 MiElements.ar(0, input, 0, 40, geom: g, bright:0.4, damp:0.9, space: space)}
