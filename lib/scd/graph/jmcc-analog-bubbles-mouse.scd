// analog bubbles with mouse control (jmcc) #3
var y = MouseY.kr(0.1, 10, 'exponential', 0.2); // lfo 1 rate
var x = MouseX.kr(2, 40, 'exponential', 0.2);  // lfo 2 rate
var lfo2 = LFSaw.kr(x, 0) * -3 + 80; // depth & offset in semitones
var lfo1 = LFSaw.kr(y, 0) * 24 + lfo2; // depth in semitones, offset is lfo2
var freq = lfo1.midicps; // convert to frequency
CombN.ar(SinOsc.ar(freq, 0) * 0.04, 0.2, 0.2, 2) // echoing sine wave

