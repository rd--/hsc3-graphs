(* ControlIn ; read from control bus ; stereo *)
let writer = ControlOut(7, LfNoise2([1, 3]) * 0.5 + 0.5);
let reader = SinOsc(ControlIn(2, 7) * 100 + 200, 0) * 0.1;
reader <! writer
