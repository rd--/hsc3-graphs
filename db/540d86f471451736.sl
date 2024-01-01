var tr = Impulse(1, 0);
var start = TRand(222, 333, tr);
var step = TRand(111, 555, tr);
var freq = 8.arithmeticSeries(start, step);
(SinOsc(freq, 0) / TRand(7, 13, tr)).Splay
