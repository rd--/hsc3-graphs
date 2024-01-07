let n = 5;
let freq = { ExpRand(111, 333) } ! n;
let ampl = { ExpRand(0.05, 0.10) } ! n;
let o = SinOsc(freq, 0) * ampl;
o.Splay
