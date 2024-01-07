let a = Dibrown(inf, 0, 15, 1);
let trig = Impulse(MouseX(1, 40, 1, 0.2), 0);
let freq = Demand(trig, 0, a) * 30 + 340;
SinOsc(freq, 0) * 0.1
