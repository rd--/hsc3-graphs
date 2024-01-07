(* Demultiplexer ; sums to identity *)
let tr = Impulse(4, 0);
let input = SinOsc(440, 0);
let numChannels = 4;
let selector = TiRand(0, numChannels - 1, tr);
Demultiplexer(numChannels, input, selector).Sum * 0.1
