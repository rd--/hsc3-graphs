// MiRings ; sympathetic_string_quantized --> chords
{var input = PinkNoise.ar(0.2);
 var bright = LFNoise2.kr(0.5).range(0.15, 1);
 var struct = LFNoise0.kr(0.2).range(0,1);
 MiRings.ar(input, 0, 40, struct, bright, 0.7, 0.25, model:4, poly: 1) * 0.35}
