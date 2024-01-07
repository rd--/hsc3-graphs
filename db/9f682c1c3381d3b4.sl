(* SinOsc ; modulate freq *)
let f1 = XLine(1, 1000, 9);
let f2 = SinOsc(f1, 0) * 200 + 800;
SinOsc(f2, 0) * 0.25
