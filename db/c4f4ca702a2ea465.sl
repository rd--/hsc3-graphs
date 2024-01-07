(* https://scsynth.org/t/6452 ; rd edit *)
let tr = Impulse(1 * Line(0.1, 10, 90), 0);
let k = 8;
let carFreq = TRand(322, 3222, tr);
let modFreq = TRand(322, 3222, tr);
let pan = TRand(-1, 1, tr);
GrainFm(k, tr, 0.1, carFreq, modFreq, 1, pan, -1, 128).Splay / 99
