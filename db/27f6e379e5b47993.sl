/* Dshuf ; audio rate */
let seq = Dseq(inf, Dshuf(5, { Rand(0, 10) } ! 81));
let trig = Impulse(MouseX(1, 10000, 1, 0.2), 0);
let freq = Demand(trig, 0, seq) * 30 + 340;
SinOsc(freq, 0) * 0.1
