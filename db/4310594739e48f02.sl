{- Multiplexer (ie. Select) ; identity -}
let numChannels = 4;
let tr = Impulse(4, 0);
let selector = TiRand(0, numChannels - 1, tr);
let env = Decay2(tr, 1 / 11, 1 / 3) / 5;
let inputList = SinOsc({ Rand(48, 72).MidiCps } ! numChannels, 0) * env;
let signalA = Multiplexer(selector, inputList);
let signalB = Select(selector, inputList);
let signalC = Demultiplexer(numChannels, signalA, selector).Sum;
[signalA, signalB, signalC].Splay2
