(* https://scsynth.org/t/6452 ; rd edit *)
var k = 8;
var tr = Impulse(100 * Line(0.1, 10, 15), 0);
GrainSin(k, tr, Line(1, 0.25, 15), TRand(322, 3222, tr), TRand(-1, 1, tr), -1, 2048).Splay / 99
