// Hold ; audio rate
var freq = LFNoise2.ar(2).range(111, 555);
var latchFreq = Hold.ar(freq, MouseX.kr(0.025, 2, 1, 0.2));
SinOsc.ar([freq, latchFreq], 0) * 0.1
