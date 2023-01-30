;; MiRings ; simple vibrato
var trig = Dust(0.5);
var pit = Latch(WhiteNoise(), trig).Range(36, 48) + SinOsc(3, 0);
MiRings(in: 0, trig: 0, pit: pit, struct: 0.2, bright: 0.5, damp: 0.7, pos: 0.25, model: 0, poly: 1, intern_exciter: 0, easteregg: 0, bypass: 0)
