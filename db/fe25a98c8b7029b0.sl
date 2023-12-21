(* Angry birds *)
var lfo = LfNoise1([28, 27]) * 400 + 2000;
SinOsc(lfo, 0) * 0.1
