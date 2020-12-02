// MiElements ; easteregg: 2x2-op FM synth
{var mod = LFNoise1.kr(0.3,0.5,0.5);
 var ratio = 0.25;
 var ratio2 = 0.25;
 var ratio3 = 0.51;
 MiElements.ar(gate:1, contour: 0.5, pit: 48, bow_level: ratio, blow_level: 0.6, strike_level: 0.5, flow: ratio2, mallet: ratio3, bow_timb: mod, blow_timb: 0.3, strike_timb: 0.6, strength: 0.9, geom: 0.12, bright: 0.6, damp: 0.5, space: 0.7, easteregg: 1)}
