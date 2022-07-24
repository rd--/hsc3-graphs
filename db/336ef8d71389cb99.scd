// https://scsynth.org/t/phaseshaping-osc-algorithms/3926/4 ; sp ; mouse control
var width = MouseX.kr().clip(0.05,0.95);
var freq = MouseY.kr(200, 1000);
var saw = LFSaw.ar(freq/2, 1).linlin(-1,1, width.neg, 1-width);
var trig = ToggleFF.ar(Trig.ar(saw.neg, 2/SampleRate.ir)+Trig.ar(saw, 2/SampleRate.ir));
var a = saw.linlin(width.neg, 0, 0, pi).sin;
var b = saw.linlin(0, 1-width, 0, 2pi).sin;
Select.ar(trig, [b,a]).dup * 0.1
