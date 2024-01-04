(* Demultiplexer ; sums to identity *)
var tr = Impulse(4, 0);
var input = SinOsc(440, 0);
var numChannels = 4;
var selector = TiRand(0, numChannels - 1, tr);
Demultiplexer(numChannels, input, selector).Sum * 0.1
