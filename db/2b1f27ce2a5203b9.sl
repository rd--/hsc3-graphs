(* Resonz ; modulate frequency ; XLine *)
var f = XLine(1000, 8000, 10);
Resonz(WhiteNoise() * 0.1, f, 0.05)
