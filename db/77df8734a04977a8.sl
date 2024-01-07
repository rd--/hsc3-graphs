let i = Dust([2, 3]);
let tr = Trig1(i, TRand([0.1, 0.01], 0.35, i));
let f = TExpRand([220, 550], 880, tr);
let a = TExpRand([0.1, 0.01], 0.25, tr);
tr.Lag(0.05) * SinOsc(f, 0) * a
