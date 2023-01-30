;; MiRings ; using the 'pit' input to set midi pitch and excite the resonator
var pit = LinLin(LfNoise0(2), -1, 1, 30, 50);
var model = 2;
MiRings(in: 0, trig: 0, pit: pit, struct: 0.25, bright: 0.5, damp: 0.7, pos: 0.25, model: model, poly: 1, intern_exciter: 0, easteregg: 0, bypass: 0) * 0.5
