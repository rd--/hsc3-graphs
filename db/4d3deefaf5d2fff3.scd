// MiRings ; inharmonic string
var trig = Dust.kr(3);
var pit = Latch.kr(WhiteNoise.kr(), Dust.kr(0.5)).range(30, 60);
var struct = Latch.kr(PinkNoise.kr(), trig).range(0.1, 1);
var damp = 0.8;
var model = 2;
var poly = 4;
MiRings.ar(in: 0, trig: trig, pit: pit, struct: struct, bright: 0.5, damp: damp, pos: 0.25, model: model, poly: poly, intern_exciter: 0, easteregg: 0, bypass: 0) * 0.25
