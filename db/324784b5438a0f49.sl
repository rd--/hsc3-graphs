(* Resonz ; modulate bandwidth opposite direction *)
var bw = XLine(0.001, 1, 8);
Resonz(WhiteNoise() * 0.1, 2000, bw)
