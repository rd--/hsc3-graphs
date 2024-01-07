(* Stepper *)
let scale = [0 2 4 5 7 9 11 12] + 60;
let clock = Impulse(3, 0);
let index = Stepper(clock, 1, 0, scale.size - 1, 1, 0);
let freq = Multiplexer(index, scale).MidiCps;
SinOsc(freq, 0) * 0.1
