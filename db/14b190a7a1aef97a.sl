(* theremin (jmcc) *)
var mod = 7;
var detune = 0;
var x = MouseX(0, 0.9, 0, 0.2);
var y = MouseY(4000, 200, 1, 0.8) + detune;
var f = y + (y * SinOsc(mod, 0) * 0.02);
EqPan2(SinOsc(f, 0), 0) * x * 0.1
