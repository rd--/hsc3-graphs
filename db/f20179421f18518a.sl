{- Dseq ; at control rate -}
let n = Dseq(3, [1 3 2 7 8]);
let x = MouseX(1, 40, 1, 0.1);
let t = Impulse(x, 0);
let f = Demand(t, 0, n) * 30 + 340;
SinOsc(f.kr, 0) * 0.1
