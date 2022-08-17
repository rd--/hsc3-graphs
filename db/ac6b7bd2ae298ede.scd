// MiElements ; blow ; contour
var gate = LFPulse.kr(1, 0.01, 0.5);
var pit = SinOsc.kr(5, 0) * 0.1 + 53;
var contour = LinLin.kr(SinOsc.kr(0.8, 0), -1, 1, 0, 1);
var flow = LinLin.kr(LFNoise1.kr(0.1), -1, 1, 0, 1);
MiElements.ar(blow_in: 0, strike_in: 0, gate: gate, pit: pit, strength: 0.5, contour: contour, bow_level: 0, blow_level:0.5, strike_level: 0, flow: flow, mallet: 0.5, bow_timb: 0.5, blow_timb: 0.3, strike_timb: 0.5, geom: 0.25, bright:0.3, damp:0.8)
