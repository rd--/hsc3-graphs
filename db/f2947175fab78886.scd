// DurationGate ; audio rate
var x = LFNoise2.ar(1).expRange(0.025, 2);
var gate = DurationGate.ar(x);
var trig = Trig1.ar(gate, SampleDur.ir);
var freq = LFNoise2.ar(2).range(111, 555);
var latchFreq = Latch.ar(freq, trig);
SinOsc.ar([freq, latchFreq], 0) * 0.1
