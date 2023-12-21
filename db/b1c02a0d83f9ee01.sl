(* Ping pong *)
var rate = 5;
var tr = Impulse(5, 0);
var freq = TRand([36, 60], [72, 86], tr).MidiCps;
var ratio = 2;
var env = Decay2(tr, 0, 1.25 / rate);
PmOsc(freq, freq * ratio, 3 + env * 4, 0) * env * 0.25
