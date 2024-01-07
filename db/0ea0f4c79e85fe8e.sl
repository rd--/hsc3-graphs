let seq = Dwhite(inf, 0, MouseY(7, 45, 0, 0.2));
let trig = Impulse(MouseX(1, 40, 1, 0.2), 0);
let freq = Demand(trig, 0, seq) * 30 + 340;
SinOsc(freq, 0) * 0.1
