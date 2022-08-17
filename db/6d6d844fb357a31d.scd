// MiRings ; simple vibrato
var trig = Dust.kr(0.5);
var pit = Latch.kr(WhiteNoise.kr(), trig).range(36, 48) + SinOsc.kr(3, 0);
MiRings.ar(in: 0, trig: 0, pit: pit, struct: 0.2, bright: 0.5, damp: 0.7, pos: 0.25, model: 0, poly: 1, intern_exciter: 0, easteregg: 0, bypass: 0)
