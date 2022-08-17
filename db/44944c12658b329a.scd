// MiRings ; sympathetic strings
var trig = Dust.kr(1);
var pit = Latch.kr(WhiteNoise.kr(), trig).range(30, 60).round;
var struct = LinLin.kr(LFNoise2.kr(0.4), -1, 1, 0, 1);
var model = 1;
var poly = 4;
MiRings.ar(in: 0, trig: 0, pit: pit, struct: struct, bright: 0.5, damp: 0.7, pos: 0.25, model: model, poly: poly, intern_exciter: 0, easteregg: 0, bypass: 0) * 0.5
