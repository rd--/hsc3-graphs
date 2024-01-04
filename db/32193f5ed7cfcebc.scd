// Hold ; control rate
var freq = LFNoise2.kr(2).range(111, 555);
var latchFreq = Hold.kr(freq, MouseX.kr(0.025, 2, 1, 0.2));
SinOsc.ar([freq, latchFreq], 0) * 0.1
