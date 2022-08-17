// MiTides ; phasing
var shape = 0.2;
var slope = 0.0;
var shift = LFNoise1.ar(0.3).range(0,1);  // slightly shift phases
var smooth = LFNoise1.kr(0.02).range(0.1, 0.9);
var out = MiTides.ar(70, shape, slope, smooth, shift, output_mode: 2) * 0.15;
Splay.ar(out)
