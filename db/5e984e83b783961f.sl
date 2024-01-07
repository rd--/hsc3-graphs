(* SvfLp ; changing Q *)
let q = Line(2, 0.0001, 20);
SvfLp(WhiteNoise() * 0.1, 400, q)
