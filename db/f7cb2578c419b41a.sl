(* Blip *)
let ln = Line(1, 20, 60);
let tr = Impulse(ln, 0);
Blip(TRand(100, 1000, tr), TRand(1, 10, tr)) * Perc(tr, 0.01, 1 / ln, -4) * 0.25
