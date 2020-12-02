// MiRings ; string_and_reverb --> spacey ; force 'internal exciter'
{var input = PinkNoise.ar(0.2);
 var trig = Dust.kr(0.7);
 var struct = LFNoise1.kr(0.4).range(0,1);
 var pos = LFNoise2.kr(0.1).range(0,1);
 MiRings.ar(input, trig, 60, struct, 0.5, 0.7, pos, intern_exciter: 1, model:5, poly: 4) * 0.25}
