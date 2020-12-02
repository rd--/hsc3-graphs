// MiRings ; intern_exciter ON
{var input = Crackle.ar(1.999, 0.2);
 var trig = Dust.ar(0.7);
 var bright = LFNoise1.kr(0.4).range(0.1,0.8);
 var pos = LFNoise2.kr(0.1).range(0,1);
 MiRings.ar(input, trig, 56, 0.1, bright, 0.6, pos, intern_exciter: 1, model:0, poly: 3) * 0.35}
