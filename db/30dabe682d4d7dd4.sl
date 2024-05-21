let a = Diwhite(inf, 0, [13 15]);
let t = Impulse(MouseX(1, 40, 1, 0.2), 0);
let f = Demand(t, 0, a) * 30 + 340;
SinOsc(f, 0) * 0.1
