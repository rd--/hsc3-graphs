(* Saw as an Lfo *)
var lfo = LfSaw(2, 0) * -100 + 600;
SinOsc(lfo, 0) * 0.1
