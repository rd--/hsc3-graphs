(* Latch *)
var l = Latch(WhiteNoise (), Impulse(9, 0));
SinOsc(l * 400 + 500, 0) * 0.2
