(* SvfBp ; changing Q (slowly) *)
let q = Line(2, 0.0001, 20);
SvfBp(WhiteNoise() * 0.1, 400, q)
