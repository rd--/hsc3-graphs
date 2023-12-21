// Demultiplexer ; sums to identity
var tr = Impulse.ar(4, 0);
var input = SinOsc.ar(440, 0);
var numChannels = 4;
var selector = TIRand.ar(0, numChannels - 1, tr);
Demultiplexer.ar(numChannels, input, selector).sum * 0.1
