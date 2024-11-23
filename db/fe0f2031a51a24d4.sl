let t = Impulse(4, 0);
let f = Sequencer([111 222 333 444], t);
SinOsc(f, 0) * Perc(t, 0.1, 0.1, 0) * 0.1
