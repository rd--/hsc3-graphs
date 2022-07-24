// SinOsc ; https://scsynth.org/t/6264/8 (fm)
var  freq = 110;
var indexLimit = 1.5;
var index = LinLin.ar(SinOsc.ar(1 / 10, 3 * pi / 2), -1, 1, 1, indexLimit);
var phase = index * LocalIn.ar(1, 1);
var sig = SinOsc.ar(freq, phase) + SinOsc.ar(freq * 0.001, index * LocalIn.ar(1, 1)).softclip;
LocalOut.ar(sig);
sig * 0.1
