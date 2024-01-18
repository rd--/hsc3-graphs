{- Dseq ; at audio rate ; mouse control -}
let n = Dseq(inf, [1 3 2 7 8 32 16 18 12 24]);
let x = MouseX(1, 10000, 1, 0.1);
let t = Impulse(x, 0);
let f = Demand(t, 0, n) * 30 + 340;
SinOsc(f, 0) * 0.1
