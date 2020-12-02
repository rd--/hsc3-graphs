// MiRings ; inharmonic string
{var trig = Dust.kr(3);
 var trigPit = Dust.kr(0.5);
 var pit = Latch.kr(WhiteNoise.kr(), trigPit).range(30, 60);
 var struct = Latch.kr(PinkNoise.kr(), trig).range(0.1,1);
 MiRings.ar(0, trig, pit, struct, 0.5, 0.8, model: 2, poly: 4) * 0.25}
