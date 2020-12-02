// MiTides ; gate
{var freq = 5;  // attack rate
 var shape = LFTri.ar(0.13).range(0,1);
 var slope = 0.5;
 var smooth = LFTri.ar(0.1).range(0,1);
 var trig = LFPulse.ar(1);
 var env = MiTides.ar(freq, shape, slope, smooth, 0.8, trig: trig, output_mode: 0, ramp_mode: 0);
 var sine = PMOsc.ar(150, 300, 2);
 sine * env[0]}
