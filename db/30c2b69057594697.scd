// MiRings ; simple vibrato
{var trig = Dust.kr(0.5);
 var pit = Latch.kr(WhiteNoise.kr(), trig).range(36, 48);
 var vib = SinOsc.kr(3);
 MiRings.ar(0, 0, pit+vib, 0.2, model: 0)}
