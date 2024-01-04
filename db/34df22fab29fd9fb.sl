(* Stepper *)
var scale = [0 2 4 5 7 9 11 12] + 60;
var clock = Impulse(3, 0);
var index = Stepper(clock, 1, 0, scale.size - 1, 1, 0);
var freq = Multiplexer(index, scale).MidiCps;
SinOsc(freq, 0) * 0.1
