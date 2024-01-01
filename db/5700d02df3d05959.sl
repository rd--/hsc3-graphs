var seq = Dbrown(inf, 10, 15, 1);
var trig = Impulse(MouseX(1, 40, 1, 0.2), 0);
var freq = Demand(trig, 0, seq) * 30 + 340;
SinOsc(freq, 0) * 0.1
