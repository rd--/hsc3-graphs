// MiElements ; blow
var pit = LinLin.kr(LFNoise0.kr(0.1), -1, 1, 32, 44);
var flow = LFNoise1.kr(0.4) * 0.5 + 0.5;
var blow_timb = LFNoise1.kr(0.2) * 0.5 + 0.5;
MiElements.ar(blow_in: 0, strike_in: 0, gate: 1, pit: pit, strength: 0.5, contour: 0.5, bow_level: 0, blow_level: 0.6, strike_level: 0, flow: flow, mallet: 0.5, bow_timb: 0.5, blow_timb: blow_timb) * 0.25
