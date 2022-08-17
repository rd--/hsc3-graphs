// MiTides ; amplitude mode
var freq = 0.15;
var shape = 0.2;
var slope = 0.2;
var level = LFTri.ar(0.1).range(0,1);
var env = MiTides.ar(freq, shape, slope, 0.3, level, output_mode: 1, ramp_mode: 1);
var sines = SinOsc.ar([200,300,500,900]);
Splay.ar(sines * env)
