(* SinOsc ; phase input ; constant frequency *)
var freq = 440;
var rate = 2 * pi * freq / SampleRate();
var phase = Phasor(1, rate, 0, 2 * pi, 0);
SinOsc(0, phase) * 0.1
