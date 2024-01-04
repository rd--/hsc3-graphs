let seq = Dseries(inf, 0, [1, 3]);
let trig = Dust(MouseX(1, 40, 1, 0.2));
let freq = Demand(trig, 0, seq) % [15, 45] * 30 + 340;
SinOsc(freq.Lag(0.025), 0) * 0.1
