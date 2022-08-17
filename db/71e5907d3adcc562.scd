// MiRings ; easter egg --> drone ; set damp to 1.0 to get a sustaining sound that doesn't need to be triggered
var struct = LFNoise2.kr(0.2).range(0,1);
var brightness = LFNoise1.kr(0.5).range(0,1);
MiRings.ar(pit: 40, struct: struct, bright: brightness, pos: 0.9, damp: 1.0, poly: 2, model: 2, easteregg: 1) * 0.25
