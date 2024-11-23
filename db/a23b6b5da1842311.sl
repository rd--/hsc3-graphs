/* Sc-140 ; 19 ; MCLD */
let a = [0.02 0.1 1 2 3 4];
let k = LfPar(a + 0.5, 0).Sum;
let f = Latch(k, Impulse(a, 0));
Splay(SinOsc(f * 100 + 300, 0) / 5)
