// MiElements ; basic
var blow_in = PinkNoise.ar() * 0.3;
var gate = LFPulse.kr(2, 0, 0.5);
var pit = 45;
MiElements.ar(blow_in: blow_in, strike_in: 0, gate: gate, pit: pit, strength: 0.5, contour: 0.2, bow_level: 0, blow_level: 0, strike_level: 0, flow: 0.5, mallet: 0.5, bow_timb: 0.5, blow_timb: 0.5, strike_timb: 0.5, geom: 0.25, bright: 0.5, damp: 0.7, pos: 0.2, space: 0.3, model: 0, easteregg: 0)
