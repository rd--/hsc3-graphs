// MiTides ; phasing envs
{var freq = 10;
 var shape = 0.2;
 var slope = 0.5;
 var shift = LFTri.ar(0.1).range(0,1);
 var trig = LFPulse.ar(5);
 var env = MiTides.ar(freq, shape, slope, 0.5, shift, trig: trig, output_mode: 2, ramp_mode: 0);
 var sines = SinOsc.ar([200,300,500,700]);
 Splay.ar(sines * env * 0.25)}
