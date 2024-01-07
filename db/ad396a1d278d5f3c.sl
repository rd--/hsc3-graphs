(* Blip *)
let ln = Line(1, 20, 60);
let gate = LfPulse(ln, 0, 0.23) > 0;
Blip(TRand(100, 1000, gate), TRand(1, 10, gate)) * Asr(gate, 0.01, 1 / ln, -4) * 0.25
