// MiTides ; amplitude ; trigger input
var freq = LFNoise1.ar(0.8).range(0.2,10);
var shape = 0.2;
var slope = 0.2;
var level = LFNoise1.ar(0.3).range(0,1);
var trig = LFPulse.ar(2);
var env = MiTides.ar(freq, shape, slope, 0.3, level, trig: trig, output_mode: 1, ramp_mode: 0);
var sines = SinOsc.ar([200,300,500,700]);
Splay.ar(sines * env * 0.5)
