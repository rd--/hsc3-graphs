(* Demultiplexer *)
var tr = Impulse(4, 0);
var freq = TiRand(48, 72, tr).MidiCps;
var env = Decay2(tr, 1 / 13, 1 / 2) * 0.5;
var input = SinOsc(freq, 0) * env;
var numChannels = 4;
var selector = TiRand(0, numChannels - 1, tr);
Demultiplexer(numChannels, input, selector).Splay2
