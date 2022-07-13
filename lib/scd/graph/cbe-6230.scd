// https://scsynth.org/t/6230 (cbe)
var freq = XLine.ar(800, 1200, 100);
var osc = SinOsc.ar(freq, 0);
var step1 = LFPulse.ar(freq / 2, 0, 0.5) * 0.5 + 0.5;
var step2 = Pulse.ar(freq / 2, 0.5) * 0.5 + 0.5;
[osc * step1, osc * step2] * 0.1
