(* Sequencer ; control rate *)
let freq = Sequencer([60 62 65 69], Impulse(2, 0).kr).MidiCps;
SinOsc(freq, 0) * 0.1
