let tr = Impulse(1, 0);
let start = TRand(222, 333, tr);
let step = TRand(111, 555, tr);
let freq = 8.arithmeticSeries(start, step);
(SinOsc(freq, 0) / TRand(7, 13, tr)).Splay
