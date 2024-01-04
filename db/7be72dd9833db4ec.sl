(* Multiplexer (ie. Select) ; identity *)
var numChannels = 4;
var tr = Impulse(4, 0);
var selector = TiRand(0, numChannels - 1, tr);
var env = Decay2(tr, 1 / 11, 1 / 3) / 5;
var inputArray = SinOsc({ Rand(48, 72).MidiCps } ! numChannels, 0) * env;
var signalA = Multiplexer(selector, inputArray);
var signalB = Select(selector, inputArray);
var signalC = Demultiplexer(numChannels, signalA, selector).Sum;
[signalA, signalB, signalC].Splay2
