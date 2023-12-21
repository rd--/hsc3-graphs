(* Pulse ; https://nathan.ho.name/posts/integer-ring-modulation/ *)
var freq = 100;
Pulse(freq, 0.5) * Pulse(freq * LinLin(LfTri(0.3, pi), -1, 1, 1, 20).RoundTo(1), 0.5) * 0.1
