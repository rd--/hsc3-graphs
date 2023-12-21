(* Changed ; SinOsc is constantly changing *)
var s = SinOsc(440, 0);
var c = Changed(s, 0);
s * c * 0.1
