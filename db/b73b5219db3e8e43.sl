/* Trinkets (1 & 2) (Jmcc) ; http://www.iamas.ac.jp/~aka/dspss2004/materials/ */
let amp = 0.2;
let gate = 1;
let tr = [Dust(4), Impulse(16, 0)].atRandom;
let x = SinOsc(TRand([400, 2000].atRandom, 12000, tr), 0) * Decay2(tr, 0.002, 0.04);
x := EqPan(x, TRand(-1, 1, tr));
x := CombN(x, 0.2, { Rand(0.04, 0.2) } ! 4, 2);
x * Linen(gate, 0.1, amp, 0.3, 2)
