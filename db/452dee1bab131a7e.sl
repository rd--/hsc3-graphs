let sqr = LinLin(LfPulse(1, 0, 0.5), 0, 1, 100, 400);
let crv = VarLag(sqr, 0.2, Line(-8, 8, 15));
SinOsc(crv, 0) ! 2 * 0.3
