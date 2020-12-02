// MiRings ; sympathetic strings
{var trig = Dust.kr(1);
 var pit = Latch.kr(WhiteNoise.kr(), trig).range(30, 60).round;
 var struct = LFNoise2.kr(0.4).range(0,1);
 MiRings.ar(0, 0, pit, struct, 0.5, 0.7, 0.25, model: 1, poly: 4) * 0.25}
